import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

abstract class SettingsRepository {
  Future<Either<Failure, ThemeModeOptions>> getCurrentTheme();

  Future<Either<Failure, void>> setTheme(ThemeModeOptions theme);

  Future<Either<Failure, LanguageOptions>> getCurrentLanguage();

  Future<Either<Failure, void>> setLanguage(LanguageOptions language);
}
