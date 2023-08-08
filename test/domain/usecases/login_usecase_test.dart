import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/domain/domain.dart';

import '../../helpers/default_models.dart';
import '../../helpers/test_mock.mocks.dart';

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(authRepository: mockAuthRepository);
  });

  group("LoginUseCase", () {
    final loginParams = DefaultModels.loginParams;
    final user = DefaultModels.user;

    // Mock data
    test("should return user when login is successful", () async {
      // Arrange
      final authResponse = DefaultModels.authResponse;

      when(mockAuthRepository.login(loginParams))
          .thenAnswer((_) async => Right(authResponse.idToken));
      when(mockAuthRepository.getAccount())
          .thenAnswer((_) async => Right(user));

      // Act
      final result = await loginUseCase(loginParams);

      // Assert
      expect(result, equals(Right(user)));
      verify(mockAuthRepository.login(loginParams));
      verify(mockAuthRepository.getAccount());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return failure when login fails', () async {
      // Arrange
      final failure = DefaultModels.serverFailure;

      when(mockAuthRepository.login(loginParams))
          .thenAnswer((_) async => Left(failure));
      when(mockAuthRepository.getAccount())
          .thenAnswer((_) async => Right(user));

      // Act
      final result = await loginUseCase(loginParams);

      // Assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.login(loginParams));
      verifyNoMoreInteractions(mockAuthRepository);
      // verifyZeroInteractions(mockAuthRepository.getAccount());
    });
  });
}
