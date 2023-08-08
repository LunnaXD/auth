import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/errors.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CheckAuthUseCase extends UseCase<bool, NoParams> {
  final AuthRepository _repo;

  CheckAuthUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final response = await _repo.isLoggedIn();
    return response.fold((l) => Left(l), (value) async {
      if (!value) {
        return Right(value);
      }
      final account = await _repo.getAccount();
      return account.fold((l) => Left(l), (r) => Right(value));
    });
  }
}
