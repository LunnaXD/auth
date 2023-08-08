import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../models_forms/models_forms.dart';

part 'main_menu_cubit.freezed.dart';
part 'main_menu_state.dart';

@injectable
class MainMenuCubit extends Cubit<MainMenuState> {
  MainMenuCubit() : super(MainMenuState.initial());

  Future<void> onChangedMenu(MainMenu menu) async {
    emit(MainMenuState(menu: menu));
  }
}
