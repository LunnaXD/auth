import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import 'pref_manager.dart';

abstract class SettingsLocalDataSource {
  Future<String> get currentLanguage;

  Future<Either<Failure, void>> setLanguage(String language);

  Future<String> get currentTheme;

  Future<Either<Failure, void>> setTheme(String theme);
}

@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final PrefManager _prefs;

  SettingsLocalDataSourceImpl({required PrefManager prefs}) : _prefs = prefs;

  @override
  Future<String> get currentLanguage async => _prefs.locale;

  @override
  Future<String> get currentTheme async => _prefs.theme;

  @override
  Future<Either<Failure, void>> setLanguage(String language) async {
    try {
      _prefs.locale = language;
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setTheme(String theme) async {
    try {
      _prefs.theme = theme;
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
