import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../models_forms/models_forms.dart';
import 'sign_in_formz.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final LoginUseCase _loginUseCase;

  SignInFormBloc(this._loginUseCase) : super(SignInFormState.initial()) {
    on<UserNameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<HidePasswordChanged>(_onHidePasswordChanged);
    on<AutoValidateChanged>(_onAutoValidateChanged);
    on<SignInWithEmailAndPasswordPressed>(_onSignInWithEmailAndPasswordPressed);
  }

  void _onUsernameChanged(
      UserNameChanged event, Emitter<SignInFormState> emit) {
    final username = Username.dirty(event.username);
    final form = SignInFormz(username: username, password: state.form.password);
    emit(
      state.copyWith(
        form: form,
        status: form.isValid ? FormStatus.valid : FormStatus.invalid,
      ),
    );
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<SignInFormState> emit) {
    final password = Password.dirty(event.password);
    final form = SignInFormz(username: state.form.username, password: password);
    emit(
      state.copyWith(
        form: form,
        status: form.isValid ? FormStatus.valid : FormStatus.invalid,
      ),
    );
  }

  void _onHidePasswordChanged(
      HidePasswordChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(hidePassword: event.hide ?? !state.hidePassword));
  }

  void _onAutoValidateChanged(
      AutoValidateChanged event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(autoValidate: event.autoValidate));
  }

  void _onSignInWithEmailAndPasswordPressed(
      SignInWithEmailAndPasswordPressed event,
      Emitter<SignInFormState> emit) async {
    if (state.form.isValid) {
      emit(state.copyWith(
          status: FormStatus.submissionInProgress, failure: null));
      final params = LoginParams(
        username: state.form.username.value,
        password: state.form.password.value,
        remember: true,
      );
      final data = await _loginUseCase.call(params);

      data.fold(
        (l) => emit(
            state.copyWith(status: FormStatus.submissionFailure, failure: l)),
        (r) => emit(state.copyWith(status: FormStatus.submissionSuccess)),
      );
    } else if (!state.autoValidate) {
      emit(state.copyWith(autoValidate: true));
    }
  }
}
