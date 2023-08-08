import 'package:dio/dio.dart';

import 'failures.dart';

enum ExceptionType {
  badRequest,
  unauthorized,
  forbidden,
  error404,
  internalServerError,
  badGateway,
  other,
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  cancelRequest,
  connectionError,
  unknown,
  unexpectedFailure,
}

class ServerException implements Exception {
  late ExceptionType exceptionType;
  late String? message;

  // @override
  // String toString() => exceptionType.message;

  ServerException.create([dynamic e]) {
    exceptionType = ExceptionType.unexpectedFailure;
    message = e?.toString();
  }

  ServerException.fromDioError(DioError dioError) {
    message = null;
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        exceptionType = ExceptionType.connectTimeout;
        break;
      case DioErrorType.sendTimeout:
        exceptionType = ExceptionType.sendTimeout;
        break;
      case DioErrorType.receiveTimeout:
        exceptionType = ExceptionType.receiveTimeout;
        break;
      case DioErrorType.badCertificate:
        exceptionType = ExceptionType.badCertificate;
        break;
      case DioErrorType.badResponse:
        exceptionType = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.cancel:
        exceptionType = ExceptionType.cancelRequest;
        break;
      case DioErrorType.connectionError:
        exceptionType = ExceptionType.connectionError;
        break;
      case DioErrorType.unknown:
        exceptionType = ExceptionType.unknown;
        break;
      default:
        exceptionType = ExceptionType.other;
        break;
    }
  }

  ExceptionType _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return ExceptionType.badRequest;
      case 401:
        return ExceptionType.unauthorized;
      case 403:
        return ExceptionType.forbidden;
      case 404:
        message = error['detail'] ?? error['title'] ?? error['error'];
        return ExceptionType.error404;
      case 500:
        return ExceptionType.internalServerError;
      case 502:
        return ExceptionType.badGateway;
      default:
        return ExceptionType.other;
    }
  }

  ServerFailure toFailure() =>
      ServerFailure(ErrorType.values[exceptionType.index], message);
}

class CacheException implements Exception {}
