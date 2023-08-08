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
  String label(BuildContext context) {
    switch (this) {
      case ThemeModeOptions.light:
        return Strings.of(context)!.themeLight;
      case ThemeModeOptions.dark:
        return Strings.of(context)!.themeDark;
      case ThemeModeOptions.system:
        return Strings.of(context)!.themeSystem;
    }
  }
}

enum LanguageOptions { spanish, english }

extension ExtensionLanguageOptions on LanguageOptions {
  String label(BuildContext context) {
    switch (this) {
      case LanguageOptions.spanish:
        return Strings.of(context)!.spanish;
      case LanguageOptions.english:
        return Strings.of(context)!.english;
    }
  }
}
