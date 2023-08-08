// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/core/core.dart' as _i24;
import 'package:auth/core/network/network_info.dart' as _i5;
import 'package:auth/core/network/network_info_module.dart' as _i31;
import 'package:auth/data/datasources/datasources.dart' as _i11;
import 'package:auth/data/datasources/local/auth_local_data_source.dart'
    as _i15;
import 'package:auth/data/datasources/local/local.dart' as _i19;
import 'package:auth/data/datasources/local/pref_manager.dart' as _i7;
import 'package:auth/data/datasources/local/settings_local_data_source.dart'
    as _i8;
import 'package:auth/data/datasources/local/shared_preferences_module.dart'
    as _i32;
import 'package:auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i21;
import 'package:auth/data/datasources/remote/services/dio_client.dart' as _i18;
import 'package:auth/data/datasources/remote/services/services.dart' as _i22;
import 'package:auth/data/repositories/auth_repository_impl.dart' as _i23;
import 'package:auth/data/repositories/settings_repository_impl.dart' as _i10;
import 'package:auth/domain/domain.dart' as _i13;
import 'package:auth/domain/repositories/auth_repository.dart' as _i26;
import 'package:auth/domain/repositories/repositories.dart' as _i9;
import 'package:auth/domain/usecases/check_auth_usecase.dart' as _i25;
import 'package:auth/domain/usecases/check_language.dart' as _i16;
import 'package:auth/domain/usecases/check_theme.dart' as _i17;
import 'package:auth/domain/usecases/login_usecase.dart' as _i27;
import 'package:auth/domain/usecases/logout_usecase.dart' as _i28;
import 'package:auth/domain/usecases/update_language.dart' as _i12;
import 'package:auth/domain/usecases/update_theme.dart' as _i14;
import 'package:auth/presentation/blocs/auth/auth_cubit.dart' as _i30;
import 'package:auth/presentation/blocs/main/menu/main_menu_cubit.dart' as _i4;
import 'package:auth/presentation/blocs/settings/settings_cubit.dart' as _i20;
import 'package:auth/presentation/blocs/sign_in/form/sign_in_form_bloc.dart'
    as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    gh.lazySingleton<_i3.InternetConnectionChecker>(
        () => networkInfoModule.connectionChecker);
    gh.factory<_i4.MainMenuCubit>(() => _i4.MainMenuCubit());
    gh.lazySingleton<_i5.NetworkInfo>(
        () => _i5.NetworkInfoImpl(gh<_i3.InternetConnectionChecker>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i7.PrefManager>(
        () => _i7.PrefManager(gh<_i6.SharedPreferences>()));
    gh.lazySingleton<_i8.SettingsLocalDataSource>(
        () => _i8.SettingsLocalDataSourceImpl(prefs: gh<_i7.PrefManager>()));
    gh.lazySingleton<_i9.SettingsRepository>(() => _i10.SettingsRepositoryImpl(
        localDataSource: gh<_i11.SettingsLocalDataSource>()));
    gh.lazySingleton<_i12.UpdateLanguageUseCase>(
        () => _i12.UpdateLanguageUseCase(gh<_i13.SettingsRepository>()));
    gh.lazySingleton<_i14.UpdateThemeUseCase>(
        () => _i14.UpdateThemeUseCase(gh<_i13.SettingsRepository>()));
    gh.lazySingleton<_i15.AuthLocalDataSource>(
        () => _i15.AuthLocalDataSourceImpl(prefs: gh<_i7.PrefManager>()));
    gh.lazySingleton<_i16.CheckLanguageUseCase>(
        () => _i16.CheckLanguageUseCase(gh<_i13.SettingsRepository>()));
    gh.lazySingleton<_i17.CheckThemeUseCase>(
        () => _i17.CheckThemeUseCase(gh<_i13.SettingsRepository>()));
    gh.singleton<_i18.DioClient>(_i18.DioClient(prefs: gh<_i19.PrefManager>()));
    gh.factory<_i20.SettingsCubit>(() => _i20.SettingsCubit(
          gh<_i13.CheckThemeUseCase>(),
          gh<_i13.CheckLanguageUseCase>(),
          gh<_i13.UpdateThemeUseCase>(),
          gh<_i13.UpdateLanguageUseCase>(),
        ));
    gh.lazySingleton<_i21.AuthRemoteDataSource>(
        () => _i21.AuthRemoteDataSourceImpl(client: gh<_i22.DioClient>()));
    gh.lazySingleton<_i13.AuthRepository>(() => _i23.AuthRepositoryImpl(
          remoteDataSource: gh<_i11.AuthRemoteDataSource>(),
          localDataSource: gh<_i11.AuthLocalDataSource>(),
          networkInfo: gh<_i24.NetworkInfo>(),
        ));
    gh.lazySingleton<_i25.CheckAuthUseCase>(
        () => _i25.CheckAuthUseCase(gh<_i26.AuthRepository>()));
    gh.lazySingleton<_i27.LoginUseCase>(
        () => _i27.LoginUseCase(authRepository: gh<_i26.AuthRepository>()));
    gh.lazySingleton<_i28.LogoutUseCase>(
        () => _i28.LogoutUseCase(gh<_i26.AuthRepository>()));
    gh.factory<_i29.SignInFormBloc>(
        () => _i29.SignInFormBloc(gh<_i13.LoginUseCase>()));
    gh.factory<_i30.AuthCubit>(() => _i30.AuthCubit(
          gh<_i13.LogoutUseCase>(),
          gh<_i13.CheckAuthUseCase>(),
        ));
    return this;
  }
}

class _$NetworkInfoModule extends _i31.NetworkInfoModule {}

class _$SharedPreferencesModule extends _i32.SharedPreferencesModule {}
