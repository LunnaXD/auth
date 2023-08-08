import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:auth/core/core.dart';
import 'package:auth/data/data.dart';
import 'package:auth/di/di.dart';
import 'package:auth/domain/domain.dart';
import 'package:auth/presentation/presentation.dart';

import '../../../helpers/setup_mock_shared_preferences.dart';
import '../../../helpers/test_mock.mocks.dart';

void main() {
  late SettingsCubit settingsCubit;
  late MockCheckThemeUseCase mockCheckThemeUseCase;
  late MockCheckLanguageUseCase mockCheckLanguageUseCase;
  late MockUpdateThemeUseCase mockUpdateThemeUseCase;
  late MockUpdateLanguageUseCase mockUpdateLanguageUseCase;

  setUp(() async {
    await setupMockPreferences();
    await configureInjection(isUnitTest: true);
    mockCheckThemeUseCase = MockCheckThemeUseCase();
    mockCheckLanguageUseCase = MockCheckLanguageUseCase();
    mockUpdateThemeUseCase = MockUpdateThemeUseCase();
    mockUpdateLanguageUseCase = MockUpdateLanguageUseCase();
    settingsCubit = SettingsCubit(
        mockCheckThemeUseCase,
        mockCheckLanguageUseCase,
        mockUpdateThemeUseCase,
        mockUpdateLanguageUseCase);
  });

  tearDown(() {
    settingsCubit.close();
  });

  group('SettingsCubit', () {
    test('initial state is SettingsState.initial()', () {
      expect(settingsCubit.state, equals(SettingsState.initial()));
    });

    test('should return active theme and language when getSettings is called',
        () async {
      // Arrange
      final nonParams = NoParams();
      const theme = ThemeModeOptions.light;
      const language = LanguageOptions.spanish;
      const expectedState = SettingsState(
        activeTheme: theme,
        activeLanguage: language,
      );

      when(mockCheckThemeUseCase.call(nonParams))
          .thenAnswer((_) async => const Right(theme));
      when(mockCheckLanguageUseCase.call(nonParams))
          .thenAnswer((_) async => const Right(language));

      // Act
      final result = await settingsCubit.getSettings();

      // Assert
      expect(result, equals(theme));
      expect(settingsCubit.state, equals(expectedState));

      verify(mockCheckThemeUseCase.call(nonParams));
      verify(mockCheckLanguageUseCase.call(nonParams));
      verifyNoMoreInteractions(mockCheckThemeUseCase);
      verifyNoMoreInteractions(mockCheckLanguageUseCase);
    });

    test('should update theme and emit new state when updateTheme is called',
        () async {
      // Arrange
      const theme = ThemeModeOptions.dark;
      const currentState = SettingsState(
        activeTheme: ThemeModeOptions.light,
        activeLanguage: LanguageOptions.spanish,
      );
      final expectedState = currentState.copyWith(activeTheme: theme);

      when(mockUpdateThemeUseCase.call(theme))
          .thenAnswer((_) async => const Right(null));

      // Act
      await settingsCubit.updateTheme(theme);

      // Assert
      expect(settingsCubit.state, equals(expectedState));

      verify(mockUpdateThemeUseCase.call(theme));
      verifyNoMoreInteractions(mockUpdateThemeUseCase);
    });

    test(
        'should update language and emit new state when updateLanguage is called',
        () async {
      // Arrange
      const language = LanguageOptions.spanish;
      const currentState = SettingsState(
        activeTheme: ThemeModeOptions.system,
        activeLanguage: LanguageOptions.english,
      );
      final expectedState = currentState.copyWith(activeLanguage: language);

      when(mockUpdateLanguageUseCase.call(language))
          .thenAnswer((_) async => const Right(null));

      // Act
      await settingsCubit.updateLanguage(language);

      // Assert
      expect(settingsCubit.state, equals(expectedState));

      verify(mockUpdateLanguageUseCase.call(language));
      verifyNoMoreInteractions(mockUpdateLanguageUseCase);
    });
  });

  // blocTest<SettingsCubit, SettingsState>(
  //   'should emit the updated state when updateLanguage is called',
  //   build: () => settingsCubit,
  //   act: (cubit) => cubit.updateLanguage(LanguageOptions.english),
  //   expect: () => [
  //     isA<SettingsState>(),
  //     // const SettingsState(activeTheme: ThemeModeOptions.system, activeLanguage: LanguageOptions.english),
  //   ],
  // );
}
