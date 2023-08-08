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

  String? failureMessage(BuildContext context) => failure?.errorStr(context);

  String? usernameError(BuildContext context) =>
      autoValidate && form.username.isNotValid
          ? form.username.error?.message(context)
          : null;

  String? passwordError(BuildContext context) =>
      autoValidate && form.password.isNotValid
          ? form.password.error?.message(context)
          : null;
}
