import 'package:flutter/material.dart';

import 'data/datasources/remote/config/config.dart';
import 'di/di.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Env.test);
  mainCommon();
}
