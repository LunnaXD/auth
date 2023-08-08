import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../models/user/user.dart';
import '../repositories/auth_repository.dart';

/**
 * Este archivo define el caso de uso LoginUseCase que se utiliza para
 * iniciar sesión en la aplicación.
 */

@lazySingleton
class LoginUseCase extends UseCase<User, LoginParams> {
  final AuthRepository _repo;

  LoginUseCase({required AuthRepository authRepository})
      : _repo = authRepository;

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    final response = await _repo.login(params);

    return response.fold((f) => Left(f), (r) async => await _repo.getAccount());
  }
}

class LoginParams {
  final String username;
  final String password;
  final bool remember;

  LoginParams({
    this.username = "",
    this.password = "",
    this.remember = false,
  });

  Map<String, dynamic> toJson() => {
        "email": username,
        "password": password,
      };
}
