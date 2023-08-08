import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../models_forms.dart';

enum MainMenu {
  dashboard,
  settings,
  logout,
}

extension ExtensionMainMenu on MainMenu {
  get isLogoutOption => this == MainMenu.logout;

  MenuData data(BuildContext context) {
    switch (this) {
      case MainMenu.dashboard:
        return MenuData(
            label: Strings.of(context)!.dashboard,
            icon: Icons.home_outlined,
            iconSelected: Icons.home);
      case MainMenu.settings:
        return MenuData(
          label: Strings.of(context)!.settings,
          icon: Icons.settings,
          iconSelected: Icons.settings,
        );
      case MainMenu.logout:
        return MenuData(
          label: Strings.of(context)!.logout,
          icon: Icons.logout,
          iconSelected: Icons.logout_rounded,
        );
    }
  }
}
