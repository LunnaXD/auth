part of 'main_menu_cubit.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState({
    required MainMenu menu,
  }) = _MainMenuState;

  factory MainMenuState.initial() {
    return const MainMenuState(
      menu: MainMenu.dashboard,
    );
  }
}
