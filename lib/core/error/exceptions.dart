/// [ServerException] represents server-side errors (5xx status codes).
class ServerException implements Exception {
  final String message;
  final int? code;

  const ServerException(this.message, {this.code});

  @override
  String toString() => 'ServerException(code: $code, message: $message)';
}

/// [NetworkException] represents connectivity issues such as no internet
/// or timeouts (e.g., `SocketException`, timeout errors).
class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => 'NetworkException(message: $message)';
}

/// [UnknownException] represents errors that are unexpected or undefined,
/// often when there's no status code or error type available.
class UnknownException implements Exception {
  final String message;

  const UnknownException(this.message);

  @override
  String toString() => 'UnknownException(message: $message)';
}

/// [BadRequestException] represents 400-level errors where the request
/// sent to the server was invalid (e.g., validation failed).
class BadRequestException implements Exception {
  final String message;
  final int? code;

  const BadRequestException(this.message, {this.code});

  @override
  String toString() => 'BadRequestException(code: $code, message: $message)';
}

/// [UnauthorizedException] represents 401 errors indicating the user is not authenticated.
class UnauthorizedException implements Exception {
  final String message;
  final int? code;

  const UnauthorizedException(this.message, {this.code});

  @override
  String toString() => 'UnauthorizedException(code: $code, message: $message)';
}

/// [ForbiddenException] represents 403 errors where the user is authenticated
/// but not authorized to access the resource.
class ForbiddenException implements Exception {
  final String message;
  final int? code;

  const ForbiddenException(this.message, {this.code});

  @override
  String toString() => 'ForbiddenException(code: $code, message: $message)';
}

/// [NotFoundException] represents 404 errors when a resource could not be found.
class NotFoundException implements Exception {
  final String message;
  final int? code;

  const NotFoundException(this.message, {this.code});

  @override
  String toString() => 'NotFoundException(code: $code, message: $message)';
}

/// [TypeException] is used when there's a mismatch or unexpected type during runtime,
/// commonly in deserialization or casting scenarios.
class TypeException implements Exception {
  final String message;
  final int? code;

  const TypeException(this.message, {this.code});

  @override
  String toString() => 'TypeException(code: $code, message: $message)';
}
