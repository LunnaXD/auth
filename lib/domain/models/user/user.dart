import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Clase que representa a un usuario en nuestra aplicación.

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _User;
}
