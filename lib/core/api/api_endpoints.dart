// API Endpoints
class Endpoints {
  static final Auth auth = Auth();
  static final User user = User();
  static final Transaction transaction = Transaction();
}

class Auth {
  final String baseUrl = 'https://api.swappid.com';
  String get login => '$baseUrl/api/v1/auth/login';
  String get register => '$baseUrl/api/v1/auth/register';
  String get refreshToken => '$baseUrl/api/v1/auth/refresh';
  String get forgotPassword => '$baseUrl/api/v1/auth/forgot-password';
  String get resetPassword => '$baseUrl/api/v1/auth/reset-password';
}

class User {
  final String baseUrl = 'https://api.swappid.com';
  String get profile => '$baseUrl/api/v1/user/profile';
  String get updateProfile => '$baseUrl/api/v1/user/update';
}

class Transaction {
  final String baseUrl = 'https://api.swappid.com';
  String get history => '$baseUrl/api/v1/transactions/history';
  String get details => '$baseUrl/api/v1/transactions/details';
}
