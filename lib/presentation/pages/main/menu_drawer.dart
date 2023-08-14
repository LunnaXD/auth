import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../utils/utils.dart';
import '../../presentation.dart';

typedef OnChangedMenu = Function(MainMenu menuSelected);

class MenuDrawer extends StatelessWidget {
  final OnChangedMenu onChangedOption;
  final VoidCallback onConfirmLogout;

  const MenuDrawer(
      {Key? key, required this.onChangedOption, required this.onConfirmLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MenuHeader(),
          const SpacerVertical(),
          _MenuOptions(
            onChangedOption: onChangedOption,
            onConfirmLogout: onConfirmLogout,
          ),
          const SpacerHorizontal(),
        ],
      ),
    );
  }
}

class _MenuHeader extends StatelessWidget {
  const _MenuHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthInPercent(100),
      height: Dimens.header,
      padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Palette.hint,
              radius: Dimens.space36 + Dimens.space2,
              child: CircleAvatar(
                backgroundImage: AssetImage(Images.icLauncher),
                radius: Dimens.space36,
              ),
            ),
            const SpacerHorizontal(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LazyCat Labs",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Palette.white),
                  ),
                  Text(
                    "lazycatlabs@gmail.com",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuOptions extends StatelessWidget {
  final OnChangedMenu onChangedOption;
  final VoidCallback onConfirmLogout;

  const _MenuOptions(
      {Key? key, required this.onChangedOption, required this.onConfirmLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainMenuCubit, MainMenuState>(
      listener: (context, state) {
        _selectedPage(context, state.menu);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: MainMenu.values
            .map<Widget>(
              (value) => SizedBox(
                width: double.maxFinite,
                child: InkWell(
                  onTap: () {
                    onChangedOption.call(value);
                    if (value.isLogoutOption) {
                      _showLogoutDialog(context);
                    } else {
                      context.read<MainMenuCubit>().onChangedMenu(value);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.space12,
                      horizontal: Dimens.space24,
                    ),
                    child: Text(
                      value.data(context).label,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  //Update page from selected Page
  void _selectedPage(BuildContext context, MainMenu mainMenu) {
    switch (mainMenu) {
      case MainMenu.dashboard:
        context.goNamed(Routes.dashboard.name);
        break;
      case MainMenu.settings:
        context.goNamed(Routes.settings.name);
        break;
      case MainMenu.logout:
        break;
    }
  }

  _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Builder(
        builder: (context) {
          return AlertDialog(
            title: Text(
              strings?.logout ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            content: Text(
              strings?.logoutDesc ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  strings?.cancel ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Palette.hint),
                ),
              ),
              TextButton(
                onPressed: onConfirmLogout,
                child: Text(
                  strings?.yes ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Palette.error),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
