// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:auth/core/core.dart' as _i30;
import 'package:auth/core/network/network_info.dart' as _i10;
import 'package:auth/core/network/network_info_module.dart' as _i37;
import 'package:auth/data/datasources/datasources.dart' as _i16;
import 'package:auth/data/datasources/local/auth_local_data_source.dart'
    as _i20;
import 'package:auth/data/datasources/local/local.dart' as _i24;
import 'package:auth/data/datasources/local/pref_manager.dart' as _i12;
import 'package:auth/data/datasources/local/settings_local_data_source.dart'
    as _i13;
import 'package:auth/data/datasources/local/shared_preferences_module.dart'
    as _i38;
import 'package:auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i27;
import 'package:auth/data/datasources/remote/config/config.dart' as _i25;
import 'package:auth/data/datasources/remote/config/dev_config.dart'
    as _i7;
import 'package:auth/data/datasources/remote/config/env_config.dart'
    as _i3;
import 'package:auth/data/datasources/remote/config/prod_config.dart'
    as _i6;
import 'package:auth/data/datasources/remote/config/test_config.dart'
    as _i4;
import 'package:auth/data/datasources/remote/config/unit_test_config.dart'
    as _i5;
import 'package:auth/data/datasources/remote/services/dio_client.dart'
    as _i23;
import 'package:auth/data/datasources/remote/services/services.dart'
    as _i28;
import 'package:auth/data/repositories/auth_repository_impl.dart' as _i29;
import 'package:auth/data/repositories/settings_repository_impl.dart'
    as _i15;
import 'package:auth/domain/domain.dart' as _i18;
import 'package:auth/domain/repositories/auth_repository.dart' as _i32;
import 'package:auth/domain/repositories/repositories.dart' as _i14;
import 'package:auth/domain/usecases/check_auth_usecase.dart' as _i31;
import 'package:auth/domain/usecases/check_language.dart' as _i21;
import 'package:auth/domain/usecases/check_theme.dart' as _i22;
import 'package:auth/domain/usecases/login_usecase.dart' as _i33;
import 'package:auth/domain/usecases/logout_usecase.dart' as _i34;
import 'package:auth/domain/usecases/update_language.dart' as _i17;
import 'package:auth/domain/usecases/update_theme.dart' as _i19;
import 'package:auth/presentation/blocs/auth/auth_cubit.dart' as _i36;
import 'package:auth/presentation/blocs/main/menu/main_menu_cubit.dart'
    as _i9;
import 'package:auth/presentation/blocs/settings/settings_cubit.dart'
    as _i26;
import 'package:auth/presentation/blocs/sign_in/form/sign_in_form_bloc.dart'
    as _i35;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

const String _test = 'test';
const String _unitTest = 'unitTest';
const String _prod = 'prod';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkInfoModule = _$NetworkInfoModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i3.EnvironmentConfig>(
      () => _i4.TestConfig(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i3.EnvironmentConfig>(
      () => _i5.UnitTestConfig(),
      registerFor: {_unitTest},
    );
    gh.lazySingleton<_i3.EnvironmentConfig>(
      () => _i6.ProdConfig(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i3.EnvironmentConfig>(
      () => _i7.DevConfig(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i8.InternetConnectionChecker>(
        () => networkInfoModule.connectionChecker);
    gh.factory<_i9.MainMenuCubit>(() => _i9.MainMenuCubit());
    gh.lazySingleton<_i10.NetworkInfo>(
        () => _i10.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i12.PrefManager>(
        () => _i12.PrefManager(gh<_i11.SharedPreferences>()));
    gh.lazySingleton<_i13.SettingsLocalDataSource>(
        () => _i13.SettingsLocalDataSourceImpl(prefs: gh<_i12.PrefManager>()));
    gh.lazySingleton<_i14.SettingsRepository>(() => _i15.SettingsRepositoryImpl(
        localDataSource: gh<_i16.SettingsLocalDataSource>()));
    gh.lazySingleton<_i17.UpdateLanguageUseCase>(
        () => _i17.UpdateLanguageUseCase(gh<_i18.SettingsRepository>()));
    gh.lazySingleton<_i19.UpdateThemeUseCase>(
        () => _i19.UpdateThemeUseCase(gh<_i18.SettingsRepository>()));
    gh.lazySingleton<_i20.AuthLocalDataSource>(
        () => _i20.AuthLocalDataSourceImpl(prefs: gh<_i12.PrefManager>()));
    gh.lazySingleton<_i21.CheckLanguageUseCase>(
        () => _i21.CheckLanguageUseCase(gh<_i18.SettingsRepository>()));
    gh.lazySingleton<_i22.CheckThemeUseCase>(
        () => _i22.CheckThemeUseCase(gh<_i18.SettingsRepository>()));
    gh.singleton<_i23.DioClient>(_i23.DioClient(
      prefs: gh<_i24.PrefManager>(),
      environmentConfig: gh<_i25.EnvironmentConfig>(),
    ));
    gh.factory<_i26.SettingsCubit>(() => _i26.SettingsCubit(
          gh<_i18.CheckThemeUseCase>(),
          gh<_i18.CheckLanguageUseCase>(),
          gh<_i18.UpdateThemeUseCase>(),
          gh<_i18.UpdateLanguageUseCase>(),
        ));
    gh.lazySingleton<_i27.AuthRemoteDataSource>(
        () => _i27.AuthRemoteDataSourceImpl(client: gh<_i28.DioClient>()));
    gh.lazySingleton<_i18.AuthRepository>(() => _i29.AuthRepositoryImpl(
          remoteDataSource: gh<_i16.AuthRemoteDataSource>(),
          localDataSource: gh<_i16.AuthLocalDataSource>(),
          networkInfo: gh<_i30.NetworkInfo>(),
        ));
    gh.lazySingleton<_i31.CheckAuthUseCase>(
        () => _i31.CheckAuthUseCase(gh<_i32.AuthRepository>()));
    gh.lazySingleton<_i33.LoginUseCase>(
        () => _i33.LoginUseCase(authRepository: gh<_i32.AuthRepository>()));
    gh.lazySingleton<_i34.LogoutUseCase>(
        () => _i34.LogoutUseCase(gh<_i32.AuthRepository>()));
    gh.factory<_i35.SignInFormBloc>(
        () => _i35.SignInFormBloc(gh<_i18.LoginUseCase>()));
    gh.factory<_i36.AuthCubit>(() => _i36.AuthCubit(
          gh<_i18.LogoutUseCase>(),
          gh<_i18.CheckAuthUseCase>(),
        ));
    return this;
  }
}

class _$NetworkInfoModule extends _i37.NetworkInfoModule {}

class _$SharedPreferencesModule extends _i38.SharedPreferencesModule {}
