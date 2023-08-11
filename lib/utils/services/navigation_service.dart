import 'package:flutter/material.dart';
import '../../presentation/presentation.dart';

class NavigationService {
  static BuildContext? get ctx =>
      AppRoute.router.routerDelegate.navigatorKey.currentContext;
}
