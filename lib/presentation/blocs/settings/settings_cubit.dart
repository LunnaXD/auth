import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final CheckThemeUseCase checkThemeUseCase;
  final CheckLanguageUseCase checkLanguageUseCase;
  final UpdateThemeUseCase updateThemeUseCase;
  final UpdateLanguageUseCase updateLanguageUseCase;

  SettingsCubit(this.checkThemeUseCase, this.checkLanguageUseCase,
      this.updateThemeUseCase, this.updateLanguageUseCase)
      : super(SettingsState.initial());

  Future<ThemeModeOptions> getSettings() async {
    final activeTheme = await checkThemeUseCase.call(NoParams());
    final activeLanguage = await checkLanguageUseCase.call(NoParams());

    return activeTheme
        .flatMap((theme) => activeLanguage.map((language) =>
            SettingsState(activeTheme: theme, activeLanguage: language)))
        .fold(
      (l) {
        if (l is ServerFailure) {
          //emit(state.copyWith(status: Status.failure, message: l.message));
        }
        return state.activeTheme;
      },
      (r) {
        emit(r);
        return r.activeTheme;
      },
    );
  }

  Future<void> updateTheme(ThemeModeOptions theme) async {
    await updateThemeUseCase.call(theme);
    emit(state.copyWith(activeTheme: theme));
  }

  Future<void> updateLanguage(LanguageOptions language) async {
    /// Update locale code
    await updateLanguageUseCase.call(language);
    emit(state.copyWith(activeLanguage: language));
  }
}
