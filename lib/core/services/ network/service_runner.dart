import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:swappid/core/helper/enums.dart';
import 'package:swappid/core/services/error/exception.dart';
import 'package:swappid/core/services/error/failure.dart';
import 'network_info.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class ServiceRunner<Type> {
  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker.instance);
  final Future<bool> Function(Type)? cacheTask;

  ServiceRunner({this.cacheTask});

  Future<Either<Failure, Type>> runService(Future<Type> Function() task) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await task.call();

        //Run Cache Task
        if (cacheTask != null) {
          cacheTask!(result);
        }

        //Return the Right side of the either type
        return Right(result);
      } on ServerException catch (e) {
        return Left(Failure(e.message, type: ErrorTypes.server));
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionError) {
          return Left(Failure('No internet connection', type: ErrorTypes.data));
        }

        if (e.response?.statusCode == 503) {
          return Left(
            Failure(
              'We\'re working on getting back up soon',
              title: 'Scheduled Maintenance! ',
              type: ErrorTypes.server,
            ),
          );
        } else {
          return Left(
            Failure(
              e.response?.data?['message'] ?? 'Error, try again ${e}',
              type: ErrorTypes.server,
            ),
          );
        }
      } on HandshakeException {
        return Left(Failure('Network Error', type: ErrorTypes.handshake));
      } on SocketException {
        return Left(Failure('Network Error', type: ErrorTypes.secket));
      } on FormatException {
        return Left(Failure('Invalid Response', type: ErrorTypes.format));
      } on TimeoutException {
        return Left(Failure('Request Timeout', type: ErrorTypes.timeout));
      } on Exception {
        return Left(Failure('Unknown Error', type: ErrorTypes.unknown));
      } finally {}
    } else {
      return Left(Failure('No network service', type: ErrorTypes.data));
    }
  }
}
