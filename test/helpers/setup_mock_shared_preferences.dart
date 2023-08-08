import 'package:shared_preferences/shared_preferences.dart';

Future setupMockPreferences([String? key, String? value]) async {
  if (key != null && value != null) {
    SharedPreferences.setMockInitialValues({'flutter.$key': value});
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  } else {
    SharedPreferences.setMockInitialValues({});
  }
}
