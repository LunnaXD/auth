import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/*
 *  Este archivo contiene la definición de la clase UserModel, que representa
 *  el modelo de usuario en nuestra aplicación. Este modelo se utiliza para
 *  serializar/deserializar objetos de usuario en/desde JSON.
 */
@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);

  User toModel() => User(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
}
