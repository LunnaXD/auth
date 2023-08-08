import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../../../core/core.dart';

enum PasswordValidationError { empty, minLength, maxLength, format }

extension StrPasswordValidationError on PasswordValidationError {
  String? message(BuildContext context) {
    switch (this) {
      case PasswordValidationError.empty:
        return Strings.of(context)?.errorEmptyPassword;
      case PasswordValidationError.minLength:
        return Strings.of(context)?.errorMinLengthPassword;
      case PasswordValidationError.maxLength:
        return Strings.of(context)?.errorMaxLengthPassword;
      case PasswordValidationError.format:
        return Strings.of(context)?.errorFormatPassword;
      default:
        return '';
    }
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static const _minLength = 3;
  static const _maxLength = 50;

  get minLength => _minLength;

  get maxLength => _maxLength;

  // static final _passwordRegex = RegExp(
  //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$');

  @override
  PasswordValidationError? validator(String value) {
    value = value.trim();

    if (value.isEmpty) return PasswordValidationError.empty;

    if (value.length < _minLength) return PasswordValidationError.minLength;

    if (value.length > _maxLength) return PasswordValidationError.maxLength;

    return null;
  }
}
