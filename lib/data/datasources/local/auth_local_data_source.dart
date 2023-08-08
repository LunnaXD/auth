import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../entites/entities.dart';
import 'pref_manager.dart';

/*
 * Este archivo define la clase AuthLocalDataSource que implementa la interfaz
 * AuthRepository. Esta clase se utiliza para interactuar con datos locales de autenticación.
 */

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);

  Future<bool> hasToken();

  Future<void> persistUser(UserEntity user);

  Future<UserEntity> getUser();

  Future<void> logout();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final PrefManager _prefs;

  AuthLocalDataSourceImpl({required PrefManager prefs}) : _prefs = prefs;

  @override
  Future<void> cacheToken(String token) async {
    _prefs.token = token;
    _prefs.isLogin = true;
  }

  @override
  Future<bool> hasToken() async {
    return _prefs.isLogin;
  }

  @override
  Future<void> persistUser(UserEntity user) async {
    _prefs.user = jsonEncode(user.toJson());
  }

  @override
  Future<UserEntity> getUser() async {
    var userJson = _prefs.user;

    if (userJson == null || userJson.isEmpty) {
      throw CacheException();
    }

    return UserEntity.fromJson(jsonDecode(userJson));
  }

  @override
  Future<void> logout() async {
    _prefs.logout();
  }
}
