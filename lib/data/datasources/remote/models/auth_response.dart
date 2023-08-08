import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String idToken;

  const AuthResponse({required this.idToken});

  @override
  List<Object?> get props => [idToken];

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        idToken: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {"token": idToken};
}
