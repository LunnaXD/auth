import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:auth/core/core.dart';
import 'package:auth/data/data.dart';
import 'package:auth/di/di.dart';

import '../../../helpers/default_models.dart';
import '../../../helpers/setup_mock_shared_preferences.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() async {
    await setupMockPreferences();
    await configureInjection(Env.unitTest);
    dioAdapter = DioAdapter(dio: getIt<DioClient>().dio);
    dataSource = AuthRemoteDataSourceImpl(client: getIt<DioClient>());
  });

  group('login', () {
    final loginParams = DefaultModels.loginParams;
    final authResponse = DefaultModels.authResponse;

    test(
      'should return AuthResponse when login response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          Url.login,
          (server) => server.reply(
            200,
            DefaultModels.authResponseJsonMap,
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, authResponse),
        );
      },
    );

    test(
      'should return ServerException when login response code is 400',
      () async {
        /// arrange
        dioAdapter.onPost(
          Url.login,
          (server) => server.reply(
            400,
            DefaultModels.authResponseJsonMapFail,
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerException>()),
          (r) => expect(r, null),
        );
      },
    );
  });

  group("getAccount", () {
    final userEntity = DefaultModels.userEntity;
    test(
      'should return UserEntity when getAccount response code is 200',
      () async {
        /// arrange
        dioAdapter.onGet(
          Url.account,
          (server) => server.reply(
            200,
            DefaultModels.userEntityJsonMap,
          ),
        );

        /// act
        final result = await dataSource.getAccount();

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, userEntity),
        );
      },
    );

    test('should return ServerException when getAccount response code is 400',
        () async {
      /// arrange
      dioAdapter.onGet(
        Url.account,
        (server) => server.reply(
          400,
          DefaultModels.userEntityJsonMapFail,
        ),
      );

      // Act
      final result = await dataSource.getAccount();

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerException>()),
        (r) => expect(r, null),
      );
    });
  });
}
