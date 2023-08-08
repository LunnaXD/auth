part of 'auth_cubit.dart';

enum AuthStatus {
  pure,
  loading,
  authenticated,
  unauthenticated,
  failure;

  bool get isLoading => this == AuthStatus.loading;

  bool get isAuthenticated => this == AuthStatus.authenticated;

  bool get isUnauthenticated => this == AuthStatus.unauthenticated;

  bool get isFailure => this == AuthStatus.failure;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    Failure? failure,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.pure,
      failure: null,
    );
  }
}
