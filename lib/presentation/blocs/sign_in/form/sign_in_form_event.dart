part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.usernameChanged(String username) =
      UserNameChanged;

  const factory SignInFormEvent.passwordChanged(String password) =
      PasswordChanged;

  const factory SignInFormEvent.hidePasswordChanged({bool? hide}) =
      HidePasswordChanged;

  const factory SignInFormEvent.autoValidateChanged(bool autoValidate) =
      AutoValidateChanged;

  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
}
