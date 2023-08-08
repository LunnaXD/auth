import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  String? message(BuildContext context) {
    switch (this) {
      case ErrorType.badRequest:
        return Strings
            .of(context)
            ?.badRequest;
      case ErrorType.unauthorized:
        return Strings
            .of(context)
            ?.unauthorized;
      case ErrorType.forbidden:
        return Strings
            .of(context)
            ?.forbidden;
      case ErrorType.internalServerError:
        return Strings
            .of(context)
            ?.internalServerError;
      case ErrorType.badGateway:
        return Strings
            .of(context)
            ?.badGateway;
      case ErrorType.other:
        return Strings
            .of(context)
            ?.other;
      case ErrorType.connectTimeout:
        return Strings
            .of(context)
            ?.connectTimeout;
      case ErrorType.sendTimeout:
        return Strings
            .of(context)
            ?.sendTimeout;
      case ErrorType.receiveTimeout:
        return Strings
            .of(context)
            ?.receiveTimeout;
      case ErrorType.badCertificate:
        return Strings
            .of(context)
            ?.badCertificate;
      case ErrorType.cancelRequest:
        return Strings
            .of(context)
            ?.cancelRequest;
      case ErrorType.connectionError:
        return Strings
            .of(context)
            ?.connectionError;
      case ErrorType.unknown:
        return Strings
            .of(context)
            ?.unknown;
      case ErrorType.error404:
      case ErrorType.unexpectedFailure:
        return null;
    }
  }
}

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);

  String? errorStr(BuildContext context);
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
  String? errorStr(BuildContext context) =>
      haveMessage ? message : errorType.message(context);
}

class NoDataFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String? errorStr(BuildContext context) => null;
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure({this.message});

  @override
  List<Object?> get props => [message];

  @override
  String? errorStr(BuildContext context) => message;
}
