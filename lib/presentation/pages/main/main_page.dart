import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../../presentation.dart';
import 'menu_drawer.dart';

class MainPage extends StatelessWidget {
  final Widget child;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: RootScaffold(
        scaffoldKey: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: _AppBar(
            onPressedLeading: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: SizedBox(
          width: context.widthInPercent(80),
          child: MenuDrawer(
            onChangedOption: (selected) {
              /// hide navigation drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
            onConfirmLogout: () {
              context.read<AuthCubit>().logout();
            },
          ),
        ),
        child: child,
      ),
    );
  }

  _onBackPressed(BuildContext context) async {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      //hide navigation drawer
      _scaffoldKey.currentState!.openDrawer();
    } else {
      MainMenu currentMenu = context.read<MainMenuCubit>().state.menu;
      if (currentMenu == MainMenu.dashboard) {
        return true;
      } else {
        context.read<MainMenuCubit>().onChangedMenu(MainMenu.dashboard);
      }
    }

    return false;
  }
}

class _AppBar extends StatelessWidget {
  final VoidCallback onPressedLeading;

  const _AppBar({Key? key, required this.onPressedLeading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: BlocBuilder<MainMenuCubit, MainMenuState>(
          buildWhen: (previous, current) => previous.menu != current.menu,
          builder: (context, state) {
            return Text(
              state.menu.data(context).label,
              style: Theme.of(context).textTheme.titleLarge,
            );
          },
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: Dimens.space24,
          ),
          onPressed: onPressedLeading,
        ),
        actions: const [
          /// Notification on Dashboard
          ButtonNotification(),
        ],
      ),
    );
  }
}
