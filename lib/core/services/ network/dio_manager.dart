import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:swappid/core/api/api_endpoints.dart';
import 'package:swappid/core/services/error/exception.dart';
import 'package:swappid/core/storage/database.dart';
import 'package:swappid/core/storage/storage.dart';
import 'package:swappid/core/storage/dispatch.dart';

// Global state for token refresh
bool _isRefreshing = false;
Completer<String>? _refreshCompleter;

// Global map to track active requests by endpoint
final Map<String, CancelToken> _cancelTokens = {};

// Token refresh function
Future<String> reAuth(Dio dio) async {
  final authData = getToken;

  if (authData == null) {
    await _performLogout();
    throw UnAuthenticatedException(message: 'No authentication data found');
  }

  try {
    final response = await dio.post(
      Endpoints.auth.refreshToken,
      data: {
        'refresh': authData.refresh,
      },
    );

    if (response.statusCode == 200) {
      // Update access token with the new token
      final accessToken = response.data['access'];
      log('Token refreshed successfully');

      setStorage(
        key: DB.TOKENS,
        value: {"access": accessToken, "refresh": authData.refresh},
      );

      return accessToken;
    } else {
      log('Token Refresh failed with status: ${response.statusCode}');
      await _performLogout();
      throw UnAuthenticatedException(message: 'Token refresh failed');
    }
  } catch (e) {
    log('Token refresh error: $e');
    await _performLogout();
    throw UnAuthenticatedException(message: 'Token refresh error: $e');
  }
}

// Centralized logout function to avoid code duplication
Future<void> _performLogout() async {
  await clearMain();
  // TODO: Implement logout
}

// Get a cancellation token for an endpoint
CancelToken _getCancelToken(String endpoint) {
  // Cancel existing request if there is one
  if (_cancelTokens.containsKey(endpoint)) {
    if (!_cancelTokens[endpoint]!.isCancelled) {
      log('Cancelling previous request to: $endpoint');
      _cancelTokens[endpoint]!.cancel('New request to the same endpoint');
    }
    _cancelTokens.remove(endpoint);
  }

  // Create new token
  final cancelToken = CancelToken();
  _cancelTokens[endpoint] = cancelToken;
  return cancelToken;
}

// Custom exception for network issues
class NetworkException extends DioException {
  NetworkException({required RequestOptions requestOptions})
      : super(
          requestOptions: requestOptions,
          error: 'Network connection unavailable',
          type: DioExceptionType.connectionError,
        );
}

class DioManager {
  final Dio dio;
  final Connectivity _connectivity;

  DioManager(this.dio, {Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity() {
    // Set up the interceptors if not already added
    if (!dio.interceptors.any((i) => i is InterceptorsWrapper)) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: onRequest,
          onResponse: onResponse,
          onError: onError,
        ),
      );
    }

    // Set up connectivity listener
    _setupConnectivityListener();
  }

  // Stream controller to broadcast network status changes
  final _networkStatusController = StreamController<bool>.broadcast();
  Stream<bool> get networkStatusStream => _networkStatusController.stream;
  bool _isNetworkAvailable = true;

  // Setup connectivity listener
  void _setupConnectivityListener() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      final isConnected =
          result.isNotEmpty && result.first != ConnectivityResult.none;

      // Only notify if status changed to avoid unnecessary broadcasts
      if (_isNetworkAvailable != isConnected) {
        _isNetworkAvailable = isConnected;
        _networkStatusController.add(isConnected);

        if (isConnected) {
          log('Network connection restored');
        } else {
          log('Network connection lost');
        }
      }
    });

    // Initial check
    _checkConnectivity();
  }

  // Check network connectivity and update status
  Future<bool> _checkConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      _isNetworkAvailable = connectivityResult != ConnectivityResult.none;
      return _isNetworkAvailable;
    } catch (e) {
      log('Error checking connectivity: $e');
      // Assume connected on error to allow request to proceed
      // It will fail naturally if there's no connection
      return true;
    }
  }

  // Make a request with network checking and cancellation
  Future<Response<T>> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // Check network connectivity before making the request
    final hasConnectivity = await _checkConnectivity();
    if (!hasConnectivity) {
      log('Network unavailable, request to $path cancelled');
      throw NetworkException(
        requestOptions: RequestOptions(path: path),
      );
    }

    // Get cancel token (this also cancels any existing request to the same endpoint)
    final cancelToken = _getCancelToken(path);

    try {
      final response = await dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options?.copyWith(method: method) ?? Options(method: method),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // Request completed successfully, remove cancel token
      if (_cancelTokens.containsKey(path)) {
        _cancelTokens.remove(path);
      }

      return response;
    } catch (e) {
      // Clean up cancel token if not already removed
      if (_cancelTokens.containsKey(path)) {
        _cancelTokens.remove(path);
      }
      rethrow;
    }
  }

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    dio.options.headers = options.headers;

    // Check network connectivity before proceeding with request
    final hasConnectivity = await _checkConnectivity();
    if (!hasConnectivity) {
      log('Network unavailable, request to ${options.path} rejected');
      return handler.reject(
        NetworkException(requestOptions: options),
      );
    }

    // Use the endpoint path as the key for cancellation
    // Only add cancel token if not already set
    if (options.cancelToken == null) {
      options.cancelToken = _getCancelToken(options.path);
    }

    log('Making request to: ${options.path}');
    handler.next(options);
  }

  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // Clean up the cancel token after successful response
    final endpoint = response.requestOptions.path;
    if (_cancelTokens.containsKey(endpoint)) {
      _cancelTokens.remove(endpoint);
    }

    handler.next(response);
  }

  void onError(DioException e, ErrorInterceptorHandler handler) async {
    final endpoint = e.requestOptions.path;

    // Clean up the cancel token if there's an error
    if (_cancelTokens.containsKey(endpoint)) {
      _cancelTokens.remove(endpoint);
    }

    // Network connectivity errors - both during request and socket errors
    if (e.type == DioExceptionType.connectionError ||
        e.error is SocketException) {
      log('Network error for ${endpoint}: ${e.message}');
      return handler.reject(
        NetworkException(requestOptions: e.requestOptions),
      );
    }

    // If this error is due to cancellation, log it and reject
    if (e.type == DioExceptionType.cancel) {
      log('Request to ${endpoint} was cancelled');
      return handler.reject(e);
    }

    // Handle 401 Unauthorized errors - token expired
    if (e.response?.statusCode == 401) {
      try {
        final requestOptions = e.requestOptions;

        // Prevent multiple simultaneous refresh attempts
        String newToken;
        if (_isRefreshing) {
          // Wait for the existing refresh to complete
          log('Waiting for existing token refresh to complete');
          newToken = await _refreshCompleter!.future;
        } else {
          // Set flag and create completer
          _isRefreshing = true;
          _refreshCompleter = Completer<String>();

          try {
            // Try to refresh the token
            newToken = await reAuth(dio);
            _refreshCompleter!.complete(newToken);
          } catch (refreshError) {
            // If refresh fails, complete the completer with error and rethrow
            _refreshCompleter!.completeError(refreshError);
            rethrow;
          } finally {
            // Reset refresh state regardless of outcome
            _isRefreshing = false;
            _refreshCompleter = null;
          }
        }

        // Token refresh successful, retry the original request
        requestOptions.headers["Authorization"] = "Bearer $newToken";

        // Create a new request with the updated token
        final response = await dio.request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        );

        return handler.resolve(response);
      } catch (refreshError) {
        // If token refresh failed, user will already be logged out in reAuth
        log('Token refresh attempt failed: $refreshError');
        return handler.reject(e);
      }
    }

    // Handle other error cases
    if (e.response?.statusCode == 503) {
      handler.reject(e);
    } else if (e.error == null) {
      handler.resolve(
        e.response ??
            Response(
              data: {
                'message': 'Oops! Something went wrong. Please try again later.'
              },
              requestOptions: RequestOptions(path: e.requestOptions.path),
            ),
      );
    } else {
      handler.reject(e);
    }
  }

  // Clean up method to cancel all pending requests
  void dispose() {
    for (final cancelToken in _cancelTokens.values) {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel('DioManager disposed');
      }
    }
    _cancelTokens.clear();
    _networkStatusController.close();
  }
}
