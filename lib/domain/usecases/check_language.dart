import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../domain.dart';

@lazySingleton
class CheckLanguageUseCase extends UseCase<LanguageOptions, NoParams> {
  final SettingsRepository _repo;

  CheckLanguageUseCase(this._repo);

  @override
  Future<Either<Failure, LanguageOptions>> call(NoParams params) async =>
      _repo.getCurrentLanguage();
}
