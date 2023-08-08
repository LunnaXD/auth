import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../domain.dart';

@lazySingleton
class UpdateThemeUseCase extends UseCase<void, ThemeModeOptions> {
  final SettingsRepository _repo;

  UpdateThemeUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(ThemeModeOptions params) async =>
      await _repo.setTheme(params);
}
