import 'package:formz/formz.dart';

import '../../../core/core.dart';

enum PasswordValidationError { empty, minLength, maxLength, format }

extension StrPasswordValidationError on PasswordValidationError {
  String? get message {
    switch (this) {
      case PasswordValidationError.empty:
        return strings?.errorEmptyPassword;
      case PasswordValidationError.minLength:
        return strings?.errorMinLengthPassword(Password._minLength);
      case PasswordValidationError.maxLength:
        return strings?.errorMaxLengthPassword(Password._maxLength);
      case PasswordValidationError.format:
        return strings?.errorFormatPassword;
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
