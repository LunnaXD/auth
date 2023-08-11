part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const SignInFormState._();

  const factory SignInFormState({
    required SignInFormz form,
    required FormStatus status,
    Failure? failure,
    required bool hidePassword,
    required bool autoValidate,
  }) = _SignInFormState;

  factory SignInFormState.initial() => const SignInFormState(
        form: SignInFormz(),
        status: FormStatus.pure,
        failure: null,
        hidePassword: true,
        autoValidate: false,
      );

  String? get failureMessage => failure?.errorStr;

  String? get usernameError =>
      autoValidate && form.username.isNotValid
          ? form.username.error?.message
          : null;

  String? get passwordError =>
      autoValidate && form.password.isNotValid
          ? form.password.error?.message
          : null;
}
