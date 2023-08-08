import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/data/data.dart';
import 'package:auth/di/di.dart';
import 'package:auth/domain/domain.dart';

import '../../helpers/default_models.dart';
import '../../helpers/setup_mock_shared_preferences.dart';
import '../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRemoteDataSource mockRemoteDatasource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late AuthRepositoryImpl repository;

  setUp(() async {
    await setupMockPreferences();
    await configureInjection(Env.unitTest);
    mockRemoteDatasource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
        remoteDataSource: mockRemoteDatasource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('login', () {
    // Mock data
    final loginParams = DefaultModels.loginParams;
    final authResponse = DefaultModels.authResponse;
    const cachedToken = 'QpwL5tke4Pnpja7X4';

    test('should return the token when login is successful', () async {
      // Arrange
      when(mockRemoteDatasource.login(loginParams)).thenAnswer(
        (_) async => Right(authResponse),
      );
      when(mockLocalDataSource.cacheToken(authResponse.idToken))
          .thenAnswer((_) async => cachedToken);

      // Act
      final result = await repository.login(loginParams);

      // Assert
      expect(result, equals(const Right(cachedToken)));
      verify(mockRemoteDatasource.login(loginParams));
      verify(mockLocalDataSource.cacheToken(authResponse.idToken));
      verifyNoMoreInteractions(mockRemoteDatasource);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return a failure when login fails', () async {
      // Arrange
      final serverException = DefaultModels.serverException;
      when(mockRemoteDatasource.login(loginParams))
          .thenAnswer((_) async => Left(serverException));

      // Act
      final result = await repository.login(loginParams);

      // Assert
      expect(result, equals(Left(serverException.toFailure())));
      verify(mockRemoteDatasource.login(loginParams));
      verifyNoMoreInteractions(mockRemoteDatasource);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });

  group("getAccount", () {
    const userEntity = UserEntity(
        id: "id", firstName: "firstName", lastName: "lastName", email: "email");
    const userModel = User(
        id: "id", firstName: "firstName", lastName: "lastName", email: "email");

    test("should return user data from remote data source when connected",
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDatasource.getAccount())
          .thenAnswer((_) async => const Right(userEntity));
      when(mockLocalDataSource.persistUser(userEntity))
          .thenAnswer((_) async {});

      // Act
      final result = await repository.getAccount();

      // Assert
      expect(result, equals(const Right(userModel)));
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDatasource.getAccount());
      verify(mockLocalDataSource.persistUser(userEntity));
      verifyNoMoreInteractions(mockNetworkInfo);
      verifyNoMoreInteractions(mockRemoteDatasource);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return user data from local data source when disconnected',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getUser()).thenAnswer((_) async => userEntity);

      // Act
      final result = await repository.getAccount();

      // Assert
      expect(result, equals(const Right(userModel)));
      verify(mockNetworkInfo.isConnected);
      verify(mockLocalDataSource.getUser());
      verifyNoMoreInteractions(mockNetworkInfo);
      verifyNoMoreInteractions(mockLocalDataSource);
      verifyZeroInteractions(mockRemoteDatasource);
    });

    test('should return a failure when remote data source returns a failure',
        () async {
      final serverException = DefaultModels.serverException;
      final serverFailure = serverException.toFailure();
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDatasource.getAccount())
          .thenAnswer((_) async => Left(serverException));

      // Act
      final result = await repository.getAccount();

      // Assert
      expect(result, equals(Left(serverFailure)));
      verify(mockNetworkInfo.isConnected);
      verify(mockRemoteDatasource.getAccount());
      verifyNoMoreInteractions(mockNetworkInfo);
      verifyNoMoreInteractions(mockRemoteDatasource);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });
}
