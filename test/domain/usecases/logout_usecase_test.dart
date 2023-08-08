import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/core/core.dart';
import 'package:auth/domain/domain.dart';

import '../../helpers/default_models.dart';
import '../../helpers/test_mock.mocks.dart';

void main() {
  late LogoutUseCase logoutUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    logoutUseCase = LogoutUseCase(mockAuthRepository);
  });

  group("LogoutUseCase", () {
    // Mock data
    test("should call logout method in AuthRepository", () async {
      // Arrange

      when(mockAuthRepository.logout())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await logoutUseCase(NoParams());

      // Assert
      expect(result, equals(const Right(null)));
      verify(mockAuthRepository.logout());
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should return failure when logout fails', () async {
      // Arrange
      final failure = DefaultModels.serverFailure;
      final logoutEither = Left(failure);

      when(mockAuthRepository.logout()).thenAnswer((_) async => logoutEither);

      // Act
      final result = await logoutUseCase(NoParams());

      // Assert
      expect(result, equals(logoutEither));
      verify(mockAuthRepository.logout());
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
