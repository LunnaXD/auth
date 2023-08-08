import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/errors.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository _repo;

  LogoutUseCase(this._repo);

  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      await _repo.logout();
}
