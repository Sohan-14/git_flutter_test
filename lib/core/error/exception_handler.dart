import 'dart:io';
import 'package:dio/dio.dart';
import '../utils/logger.dart';
import '../utils/toast/custom_toast.dart';
import 'exceptions.dart';

/// [ExceptionHandler] is responsible for interpreting and converting
/// API and network errors into application-level exceptions.
class ExceptionHandler {
  ExceptionHandler._(); // Private constructor to prevent instantiation.

  /// [handleErrorStatus] converts a Dio [Response] with an error HTTP status
  /// into a specific [AppException] based on the status code.
  ///
  /// Throws appropriate exceptions like [BadRequestException], [UnauthorizedException], etc.
  /// Returns a [ServerException] for generic server errors (2xx edge cases).
  static Exception handleErrorStatus(Response<dynamic> response) {
    final int? statusCode = response.statusCode;
    Logger().e(<String, dynamic>{"statusCode": statusCode, "status-error": response.data}.toString());

    // Handle case when no status code is returned.
    if (statusCode == null) {
      throw const UnknownException("No status code returned");
    }

    // Map HTTP status codes to appropriate exceptions.
    switch (statusCode) {
      case 400:
        throw BadRequestException("Bad request", code: statusCode);
      case 401:
        throw UnauthorizedException("Unauthorized access", code: statusCode);
      case 403:
        throw ForbiddenException("Forbidden", code: statusCode);
      case 404:
        throw NotFoundException("Resource not found", code: statusCode);
      case 500:
      case 502:
      case 503:
        throw ServerException("Server error", code: statusCode);
      default:
        if (statusCode < 200 || statusCode >= 300) {
          throw UnknownException("Unexpected error: $statusCode");
        } else {
          return ServerException("Server Exception", code: statusCode);
        }
    }
  }

  /// [handleDioError] analyzes a [DioException] and maps it to a custom [AppException].
  ///
  /// Handles:
  /// - Network and timeout errors as [NetworkException]
  /// - Dio responses with status codes as specific exceptions
  /// - Unknown or unhandled errors as [UnknownException]
  static Exception handleDioError(DioException error) {
    Logger().e(<String, dynamic>{
      "dio-error": (error.response?.data as Map<String, dynamic>?)?['message'] as String?,
    }.toString());
    // Handle internet-related exceptions.
    if (error.error is SocketException || error.type == DioExceptionType.connectionError) {
      return const NetworkException("No internet connection");
    }

    // Handle timeout-related exceptions.
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const NetworkException("Connection timeout");
    }

    final Response<dynamic>? response = error.response;
    final int? statusCode = response?.statusCode;

    // Handle unknown server error when status code is absent.
    if (statusCode == null) {
      return const UnknownException("Unknown server error with no status code");
    }

    // Map HTTP status codes to appropriate exceptions.
    switch (statusCode) {
      case 400:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message'] as String?;
        throw BadRequestException(message ?? "Bad Request", code: statusCode);
      case 401:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message'] as String?;
        throw UnauthorizedException(message ?? "Unauthorized access", code: statusCode);
      case 403:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message'] as String?;
        throw ForbiddenException(message ?? "Forbidden", code: statusCode);
      case 404:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message'] as String?;
        throw NotFoundException(message ?? "Resource not found", code: statusCode);
      case 500:
      case 502:
      case 503:
        return ServerException("Server error occurred", code: statusCode);
      default:
        if (statusCode < 200 || statusCode >= 300) {
          return UnknownException("Unexpected status code: $statusCode");
        }
        return ServerException("Server error occurred", code: statusCode);
    }
  }

  static void toastErrorMessage(dynamic e) {
    if (e is BadRequestException) {
      Toast.showError(e.message);
    } else if (e is UnauthorizedException) {
      Toast.showError(e.message);
    } else if (e is ForbiddenException) {
      Toast.showError(e.message);
    } else if (e is NotFoundException) {
      Toast.showError(e.message);
    } else if (e is ServerException) {
      Toast.showError(e.message);
    } else if (e is NetworkException) {
      Toast.showError(e.message);
    } else if (e is TypeException) {
      Toast.showError(e.message);
    } else if (e is UnknownException) {
      Toast.showError(e.message);
    } else if (e is Exception) {
      Toast.showError(e.toString());
    } else {
      Toast.showError("An unexpected error occurred");
    }
  }
}
