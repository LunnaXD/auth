import 'dart:convert';

import 'package:auth/core/core.dart';
import 'package:auth/data/data.dart';
import 'package:auth/domain/usecases/login_usecase.dart';

import 'json_reader.dart';
import 'paths.dart';

class DefaultModels {
  const DefaultModels._();

  static final loginParams =
      LoginParams(username: 'correo@electronico.com', password: 'mypassword');
  static final serverException = ServerException.create();
  static final serverFailure = serverException.toFailure();
  static final userEntityJsonMap = json.decode(jsonReader(successAccountPath));
  static final userEntityJsonMapFail =
      json.decode(jsonReader(unSuccessfulAccountPath));
  static final userEntity = UserEntity.fromJson(userEntityJsonMap);
  static final user = userEntity.toModel();
  static final authResponseJsonMap = json.decode(jsonReader(successLoginPath));
  static final authResponseJsonMapFail =
      json.decode(jsonReader(unSuccessfulLoginPath));
  static final authResponse = AuthResponse.fromJson(authResponseJsonMap);
}
