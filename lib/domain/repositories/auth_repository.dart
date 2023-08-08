import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../models/models.dart';
import '../usecases/usecases.dart';

/*
 * Este archivo define la interfaz AuthRepository que se utiliza para
 * interactuar con la capa de datos de autenticación en nuestra aplicación.
 * Esta interfaz define métodos para iniciar sesión, cerrar sesión y obtener información del usuario.
 */

abstract class AuthRepository {
  Future<Either<Failure, String>> login(LoginParams params);

  Future<Either<Failure, User>> getAccount();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, bool>> isLoggedIn();
}
