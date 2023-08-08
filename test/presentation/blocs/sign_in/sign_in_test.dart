import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/presentation/presentation.dart';

import '../../../helpers/default_models.dart';
import '../../../helpers/test_mock.mocks.dart';

void main() {
  late SignInFormBloc signInFormBloc;
  late MockLoginUseCase mockLoginUseCase;
  late SignInFormState expectedState;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    signInFormBloc = SignInFormBloc(mockLoginUseCase);
    expectedState = SignInFormState.initial();
  });

  tearDown(() {
    signInFormBloc.close();
  });

  test('initial state should be SignInFormState.initial()', () {
    expect(signInFormBloc.state, equals(SignInFormState.initial()));
  });

  group('SignInFormBloc', () {
    blocTest<SignInFormBloc, SignInFormState>(
      'emits [submissionInProgress, submissionSuccess] '
      'when login succeeds',
      setUp: () async {
        when(mockLoginUseCase.call(any))
            .thenAnswer((_) async => Right(DefaultModels.user));
      },
      build: () => signInFormBloc,
      act: (bloc) {
        bloc
          ..add(const UserNameChanged('username'))
          ..add(const PasswordChanged('password'))
          ..add(const SignInWithEmailAndPasswordPressed());
      },
      wait: const Duration(milliseconds: 100),
      expect: () => <SignInFormState>[
        signInFormBloc.state.copyWith(
          form: SignInFormz(
            username: const Username.dirty('username'),
            password: expectedState.form.password,
          ),
          status: FormStatus.invalid,
        ),
        signInFormBloc.state.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.valid,
        ),
        signInFormBloc.state.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.submissionInProgress,
        ),
        signInFormBloc.state.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.submissionSuccess,
        ),
      ],
    );

    blocTest<SignInFormBloc, SignInFormState>(
      'emits [SignInFormInProgress, SignInFormFailure] when logIn fails',
      setUp: () {
        when(mockLoginUseCase.call(any))
            .thenAnswer((_) async => Left(DefaultModels.serverFailure));
      },
      build: () => signInFormBloc,
      act: (bloc) {
        bloc
          ..add(const UserNameChanged('username'))
          ..add(const PasswordChanged('password'))
          ..add(const SignInWithEmailAndPasswordPressed());
      },
      wait: const Duration(milliseconds: 100),
      expect: () => <SignInFormState>[
        expectedState.copyWith(
          form: SignInFormz(
            username: const Username.dirty('username'),
            password: expectedState.form.password,
          ),
          status: FormStatus.invalid,
        ),
        expectedState.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.valid,
        ),
        expectedState.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.submissionInProgress,
        ),
        expectedState.copyWith(
          form: const SignInFormz(
            username: Username.dirty('username'),
            password: Password.dirty('password'),
          ),
          status: FormStatus.submissionFailure,
          failure: DefaultModels.serverFailure,
        ),
      ],
    );
  });
}
