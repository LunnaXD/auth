part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required ThemeModeOptions activeTheme,
    required LanguageOptions activeLanguage,
  }) = _SettingsState;

  factory SettingsState.initial() {
    return const SettingsState(
      activeTheme: ThemeModeOptions.system,
      activeLanguage: LanguageOptions.spanish,
    );
  }
}
