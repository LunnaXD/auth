// Mocks generated by Mockito 5.4.0 from annotations
// in auth/test/helpers/test_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:auth/core/core.dart' as _i7;
import 'package:auth/data/datasources/local/auth_local_data_source.dart'
    as _i12;
import 'package:auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i10;
import 'package:auth/data/datasources/remote/models/models.dart' as _i11;
import 'package:auth/data/entites/entities.dart' as _i3;
import 'package:auth/domain/domain.dart' as _i5;
import 'package:auth/domain/models/models.dart' as _i9;
import 'package:auth/domain/usecases/usecases.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserEntity_1 extends _i1.SmartFake implements _i3.UserEntity {
  _FakeUserEntity_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_2 extends _i1.SmartFake implements Duration {
  _FakeDuration_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_3 extends _i1.SmartFake
    implements _i4.AddressCheckResult {
  _FakeAddressCheckResult_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> login(_i8.LoginParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [params],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #login,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.User>> getAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.User>>.value(
            _FakeEither_0<_i7.Failure, _i9.User>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.User>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #isLoggedIn,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i10.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.ServerException, _i11.AuthResponse>> login(
          _i8.LoginParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [params],
        ),
        returnValue: _i6
            .Future<_i2.Either<_i7.ServerException, _i11.AuthResponse>>.value(
            _FakeEither_0<_i7.ServerException, _i11.AuthResponse>(
          this,
          Invocation.method(
            #login,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.ServerException, _i11.AuthResponse>>);
  @override
  _i6.Future<_i2.Either<_i7.ServerException, _i3.UserEntity>> getAccount() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAccount,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.ServerException, _i3.UserEntity>>.value(
                _FakeEither_0<_i7.ServerException, _i3.UserEntity>(
          this,
          Invocation.method(
            #getAccount,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.ServerException, _i3.UserEntity>>);
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i12.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> cacheToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #cacheToken,
          [token],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> hasToken() => (super.noSuchMethod(
        Invocation.method(
          #hasToken,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> persistUser(_i3.UserEntity? user) => (super.noSuchMethod(
        Invocation.method(
          #persistUser,
          [user],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.UserEntity> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i6.Future<_i3.UserEntity>.value(_FakeUserEntity_1(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i6.Future<_i3.UserEntity>);
  @override
  _i6.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i4.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_2(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);
  @override
  Duration get checkTimeout => (super.noSuchMethod(
        Invocation.getter(#checkTimeout),
        returnValue: _FakeDuration_2(
          this,
          Invocation.getter(#checkTimeout),
        ),
      ) as Duration);
  @override
  List<_i4.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i4.AddressCheckOptions>[],
      ) as List<_i4.AddressCheckOptions>);
  @override
  set addresses(List<_i4.AddressCheckOptions>? value) => super.noSuchMethod(
        Invocation.setter(
          #addresses,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i4.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i6.Future<_i4.InternetConnectionStatus>.value(
            _i4.InternetConnectionStatus.connected),
      ) as _i6.Future<_i4.InternetConnectionStatus>);
  @override
  _i6.Stream<_i4.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i6.Stream<_i4.InternetConnectionStatus>.empty(),
      ) as _i6.Stream<_i4.InternetConnectionStatus>);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
      ) as bool);
  @override
  _i6.Future<_i4.AddressCheckResult> isHostReachable(
          _i4.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i6.Future<_i4.AddressCheckResult>.value(_FakeAddressCheckResult_3(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i6.Future<_i4.AddressCheckResult>);
}

/// A class which mocks [CheckThemeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckThemeUseCase extends _i1.Mock implements _i8.CheckThemeUseCase {
  MockCheckThemeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.ThemeModeOptions>> call(
          _i7.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.ThemeModeOptions>>.value(
                _FakeEither_0<_i7.Failure, _i9.ThemeModeOptions>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.ThemeModeOptions>>);
}

/// A class which mocks [CheckLanguageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckLanguageUseCase extends _i1.Mock
    implements _i8.CheckLanguageUseCase {
  MockCheckLanguageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.LanguageOptions>> call(
          _i7.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.LanguageOptions>>.value(
                _FakeEither_0<_i7.Failure, _i9.LanguageOptions>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.LanguageOptions>>);
}

/// A class which mocks [UpdateThemeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateThemeUseCase extends _i1.Mock
    implements _i8.UpdateThemeUseCase {
  MockUpdateThemeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> call(
          _i9.ThemeModeOptions? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [UpdateLanguageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateLanguageUseCase extends _i1.Mock
    implements _i8.UpdateLanguageUseCase {
  MockUpdateLanguageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, void>> call(_i9.LanguageOptions? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, void>>.value(
            _FakeEither_0<_i7.Failure, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, void>>);
}

/// A class which mocks [LoginUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUseCase extends _i1.Mock implements _i8.LoginUseCase {
  MockLoginUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.User>> call(_i8.LoginParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.User>>.value(
            _FakeEither_0<_i7.Failure, _i9.User>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.User>>);
}
