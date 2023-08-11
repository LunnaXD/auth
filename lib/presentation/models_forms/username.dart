import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../core/core.dart';

enum UsernameValidationError { empty, minLength, maxLength, format }

extension StrUsernameValidationError on UsernameValidationError {
  String? get message {
    switch (this) {
      case UsernameValidationError.empty:
        return strings?.errorEmptyUsername;
      case UsernameValidationError.minLength:
        return strings?.errorMinLengthUsername(Username._minLength);
      case UsernameValidationError.maxLength:
        return strings?.errorMaxLengthUsername(Username._maxLength);
      case UsernameValidationError.format:
        return strings?.errorFormatUsername;
      default:
        return '';
    }
  }
}

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');

  const Username.dirty([super.value = '']) : super.dirty();

  static const _minLength = 4;
  static const _maxLength = 56;
  static final _usernameRegex = RegExp(
    r"^([a-zA-Z0-9._-]+$)|([A-Za-z0-9_.]+@[A-Za-z0-9-]+\.[A-Za-z0-9-.]+$)",
    // r"^[a-zA-Z0-9._-]+$",
  );

  get minLength => _minLength;

  get maxLength => _maxLength;

  @override
  UsernameValidationError? validator(String value) {
    value = value.trim();

    if (value.isEmpty) return UsernameValidationError.empty;

    if (value.length < _minLength) {
      return UsernameValidationError.minLength;
    }

    if (value.length > _maxLength) {
      return UsernameValidationError.maxLength;
    }

    if (!_usernameRegex.hasMatch(value)) {
      return UsernameValidationError.format;
    }

    return null;
  }
}
