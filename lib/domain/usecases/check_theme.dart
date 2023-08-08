import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../domain.dart';

@lazySingleton
class CheckThemeUseCase extends UseCase<ThemeModeOptions, NoParams> {
  final SettingsRepository _repo;

  CheckThemeUseCase(this._repo);

  @override
  Future<Either<Failure, ThemeModeOptions>> call(NoParams params) async {
    return _repo.getCurrentTheme();
  }
}
