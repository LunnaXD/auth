import 'package:flutter/material.dart';

import '../../core/core.dart';

enum ThemeModeOptions {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;

  const ThemeModeOptions(this.mode);
}

extension ExtensionThemeModes on ThemeModeOptions {
  String? get label {
    switch (this) {
      case ThemeModeOptions.light:
        return strings?.themeLight;
      case ThemeModeOptions.dark:
        return strings?.themeDark;
      case ThemeModeOptions.system:
        return strings?.themeSystem;
    }
  }
}

enum LanguageOptions { spanish, english }

extension ExtensionLanguageOptions on LanguageOptions {
  String? get label {
    switch (this) {
      case LanguageOptions.spanish:
        return strings?.spanish;
      case LanguageOptions.english:
        return strings?.english;
    }
  }
}
