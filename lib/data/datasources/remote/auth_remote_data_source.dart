import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/errors.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../entites/entities.dart';
import 'models/models.dart';
import 'services/services.dart';

/*
 * Este archivo define la clase AuthRemoteDataSource que implementa la interfaz
 * AuthRepository. Esta clase se utiliza para interactuar con una API remota que maneja la autenticación.
 */

abstract class AuthRemoteDataSource {
  Future<Either<ServerException, AuthResponse>> login(LoginParams params);

  Future<Either<ServerException, UserEntity>> getAccount();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSourceImpl({required DioClient client}) : _client = client;

  @override
  Future<Either<ServerException, AuthResponse>> login(
      LoginParams params) async {
    final response = await _client.postRequest(
      Url.login,
      data: params.toJson(),
      converter: (response) =>
          AuthResponse.fromJson(response as Map<String, dynamic>),
      // isIsolate: false,
    );

    return response;
  }

  @override
  Future<Either<ServerException, UserEntity>> getAccount() async {
    /*final response = await _client.getRequest(
      Url.account,
      converter: (response) =>
          UserEntity.fromJson(response as Map<String, dynamic>),
    );
    return response;*/
    return const Right(UserEntity(id: "", firstName: "Jonh", lastName: "Doe", email: "jonh.doe@email.com"));
  }
}
