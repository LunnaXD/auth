import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/utils.dart';
import '../../core/core.dart';
import '../../domain/models/theme_settings.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, ThemeModeOptions>> getCurrentTheme() async {
    try {
      final String language = await localDataSource.currentLanguage;
      return Right(language.toEnum<ThemeModeOptions>(ThemeModeOptions.values));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setTheme(ThemeModeOptions theme) async =>
      await localDataSource.setTheme(theme.name);

  @override
  Future<Either<Failure, LanguageOptions>> getCurrentLanguage() async {
    try {
      final String language = await localDataSource.currentLanguage;
      return Right(language.toEnum<LanguageOptions>(LanguageOptions.values));
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setLanguage(LanguageOptions language) async =>
      await localDataSource.setLanguage(language.name);
}
