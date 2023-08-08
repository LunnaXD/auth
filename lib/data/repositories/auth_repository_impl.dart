import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

/*
 * Este archivo define la implementación de la interfaz AuthRepository.
 * Esta implementación se utiliza para interactuar con las fuentes de datos de autenticación,
 * tanto remotas como locales. Esta clase se utiliza para gestionar la autenticación del usuario.
 */

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> login(LoginParams params) async {
    final response = await remoteDataSource.login(params);

    return response.fold(
      (e) => Left(e.toFailure()),
      (response) async {
        await localDataSource.cacheToken(response.idToken);
        return Right(response.idToken);
      },
    );
  }

  @override
  Future<Either<Failure, User>> getAccount() async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.getAccount();

      return response.fold(
        (e) => Left(e.toFailure()),
        (response) {
          localDataSource.persistUser(response);
          return Right(response.toModel());
        },
      );
    } else {
      try {
        final user = await localDataSource.getUser();
        return Right(user.toModel());
      } on CacheException catch (e) {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    //logout from backend
    return Right(await localDataSource.logout());
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    return Right(await localDataSource.hasToken());
  }
}
