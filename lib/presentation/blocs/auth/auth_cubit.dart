import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LogoutUseCase _logoutUseCase;
  final CheckAuthUseCase _checkAuthUseCase;

  AuthCubit(this._logoutUseCase, this._checkAuthUseCase)
      : super(AuthState.initial());

  Future<void> loadApp() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final isLoggedIn = await _checkAuthUseCase.call(NoParams());
    isLoggedIn.fold(
      (l) {
        if (l is ServerFailure && l.errorType == ErrorType.unauthorized) {
          logout();
        } else {
          emit(state.copyWith(status: AuthStatus.failure, failure: l));
        }
      },
      (r) {
        if (r) {
          emit(state.copyWith(status: AuthStatus.authenticated));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated));
        }
      },
    );
  }

  Future<void> logout() async {
    emit(state.copyWith(status: AuthStatus.loading));
    _logoutUseCase.call(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}
