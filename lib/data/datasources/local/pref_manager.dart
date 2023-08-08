import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PrefManager {
  static const String _kToken = "token";
  static const String _kIsLogin = "isLogin";
  static const String _kUser = "user";
  static const String _kLocale = "locale";
  static const String _kTheme = "theme";

  SharedPreferences preferences;

  PrefManager(this.preferences);

  set token(String? value) => preferences.setString(_kToken, value ?? "");

  String? get token => preferences.getString(_kToken);

  set isLogin(bool value) => preferences.setBool(_kIsLogin, value);

  bool get isLogin => preferences.getBool(_kIsLogin) ?? false;

  set user(String? value) => preferences.setString(_kUser, value ?? "");

  String? get user => preferences.getString(_kUser);

  set locale(String value) => preferences.setString(_kLocale, value);

  /// Default locale set to Spanish
  String get locale => preferences.getString(_kLocale) ?? "es";

  set theme(String value) => preferences.setString(_kTheme, value);

  /// Default system Theme
  String get theme => preferences.getString(_kTheme) ?? "system";

  void logout() => preferences.clear();
}
