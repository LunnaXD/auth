import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../domain.dart';

@lazySingleton
class UpdateLanguageUseCase extends UseCase<void, LanguageOptions> {
  final SettingsRepository _repo;

  UpdateLanguageUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(LanguageOptions params) async =>
      await _repo.setLanguage(params);
}
