class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class DatabaseFailure extends AppException {
  DatabaseFailure(String message) : super(message);
}

class PermissionFailure extends AppException {
  PermissionFailure(String message) : super(message);
}

class NetworkFailure extends AppException {
  NetworkFailure(String message) : super(message);
}

class UnknownFailure extends AppException {
  UnknownFailure(String message) : super(message);
}
