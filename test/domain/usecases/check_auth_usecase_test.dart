import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/core/core.dart';
import 'package:auth/domain/domain.dart';

import '../../helpers/default_models.dart';
import '../../helpers/test_mock.mocks.dart';

void main() {
  late CheckAuthUseCase checkAuthUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    checkAuthUseCase = CheckAuthUseCase(mockAuthRepository);
  });

  group("CheckAuthUseCase", () {
    test('should return true when user is logged in', () async {
      // Arrange
      final getAccountEither = DefaultModels.user;

      when(mockAuthRepository.isLoggedIn())
          .thenAnswer((_) async => const Right(true));
      when(mockAuthRepository.getAccount())
          .thenAnswer((_) async => Right(getAccountEither));

      // Act
      final result = await checkAuthUseCase(NoParams());

      // Assert
      expect(result, equals(const Right(true)));
      verify(mockAuthRepository.isLoggedIn());
      verify(mockAuthRepository.getAccount());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return false when user is not logged in', () async {
      // Arrange
      when(mockAuthRepository.isLoggedIn())
          .thenAnswer((_) async => const Right(false));

      // Act
      final result = await checkAuthUseCase.call(NoParams());

      // Assert
      expect(result, equals(const Right(false)));
      verify(mockAuthRepository.isLoggedIn());
      verifyNoMoreInteractions(mockAuthRepository);
      // verifyZeroInteractions(mockAuthRepository.getAccount());
    });

    test('should return failure when isLoggedIn fails', () async {
      // Arrange
      final failure = DefaultModels.serverFailure;

      when(mockAuthRepository.isLoggedIn())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await checkAuthUseCase(NoParams());

      // Assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.isLoggedIn());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return failure when getAccount fails', () async {
      // Arrange
      final failure = DefaultModels.serverFailure;

      when(mockAuthRepository.isLoggedIn())
          .thenAnswer((_) async => const Right(true));
      when(mockAuthRepository.getAccount())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await checkAuthUseCase(NoParams());

      // Assert
      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.isLoggedIn());
      verify(mockAuthRepository.getAccount());
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
