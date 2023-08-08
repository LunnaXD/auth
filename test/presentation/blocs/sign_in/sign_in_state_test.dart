import 'package:flutter_test/flutter_test.dart';
import 'package:auth/presentation/presentation.dart';

void main() {
  group('SignInFormState', () {
    test('returns same object when no properties are passed', () {
      const state = SignInFormState(
        form: SignInFormz(),
        status: FormStatus.pure,
        failure: null,
        hidePassword: true,
        autoValidate: false,
      );

      expect(state.copyWith(), equals(state));
    });

    test('returns object with updated status when status is passed', () {
      const state = SignInFormState(
        form: SignInFormz(),
        status: FormStatus.pure,
        failure: null,
        hidePassword: true,
        autoValidate: false,
      );
      const newStatus = FormStatus.invalid;

      final updatedState = state.copyWith(status: newStatus);

      expect(updatedState.status, equals(newStatus));
      expect(updatedState.form, equals(state.form));
      expect(updatedState.failure, equals(state.failure));
      expect(updatedState.hidePassword, equals(state.hidePassword));
      expect(updatedState.autoValidate, equals(state.autoValidate));
    });

    test('returns object with updated username when username is passed', () {
      const state = SignInFormState(
        form: SignInFormz(),
        status: FormStatus.pure,
        failure: null,
        hidePassword: true,
        autoValidate: false,
      );
      const newUsername = 'newUsername';

      final updatedState = state.copyWith(
          form: SignInFormz(
              username: const Username.dirty(newUsername),
              password: state.form.password));

      expect(updatedState.form.username.value, equals(newUsername));
      expect(updatedState.status, equals(state.status));
      expect(updatedState.failure, equals(state.failure));
      expect(updatedState.hidePassword, equals(state.hidePassword));
      expect(updatedState.autoValidate, equals(state.autoValidate));
    });

    test('returns object with updated password when password is passed', () {
      const state = SignInFormState(
        form: SignInFormz(),
        status: FormStatus.pure,
        failure: null,
        hidePassword: true,
        autoValidate: false,
      );
      const newPassword = 'newPassword';

      final updatedState = state.copyWith(
          form: SignInFormz(
              username: state.form.username,
              password: const Password.dirty(newPassword)));

      expect(updatedState.form.password.value, equals(newPassword));
      expect(updatedState.status, equals(state.status));
      expect(updatedState.failure, equals(state.failure));
      expect(updatedState.hidePassword, equals(state.hidePassword));
      expect(updatedState.autoValidate, equals(state.autoValidate));
    });
  });
}
