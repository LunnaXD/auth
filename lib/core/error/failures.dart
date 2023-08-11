import 'package:equatable/equatable.dart';

import '../localization/localization.dart';

enum ErrorType {
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

extension ExtensionErrorType on ErrorType {
  String? get message {
    switch (this) {
      case ErrorType.badRequest:
        return strings?.badRequest;
      case ErrorType.unauthorized:
        return strings?.unauthorized;
      case ErrorType.forbidden:
        return strings?.forbidden;
      case ErrorType.internalServerError:
        return strings?.internalServerError;
      case ErrorType.badGateway:
        return strings?.badGateway;
      case ErrorType.other:
        return strings?.other;
      case ErrorType.connectTimeout:
        return strings?.connectTimeout;
      case ErrorType.sendTimeout:
        return strings?.sendTimeout;
      case ErrorType.receiveTimeout:
        return strings?.receiveTimeout;
      case ErrorType.badCertificate:
        return strings?.badCertificate;
      case ErrorType.cancelRequest:
        return strings?.cancelRequest;
      case ErrorType.connectionError:
        return strings?.connectionError;
      case ErrorType.unknown:
        return strings?.unknown;
      case ErrorType.error404:
      case ErrorType.unexpectedFailure:
        return null;
    }
  }
}

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  String? get errorStr;
}

// General failures
class ServerFailure extends Failure {
  final ErrorType errorType;
  final String? message;

  const ServerFailure(this.errorType, this.message);

  @override
  List<Object?> get props => [errorType, message];

  bool get haveMessage => message != null && message!.isNotEmpty;

  @override
  String? get errorStr =>
      haveMessage ? message : errorType.message;
}

class NoDataFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? get errorStr => null;
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure({this.message});

  @override
  List<Object?> get props => [message];

  @override
  String? get errorStr => message;
}
