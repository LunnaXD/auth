import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../models_forms/models_forms.dart';

class SignInFormz with FormzMixin, EquatableMixin {
  final Username username;
  final Password password;

  const SignInFormz({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  @override
  List<FormzInput> get inputs => [username, password];

  @override
  List<Object?> get props => [username, password];
}
