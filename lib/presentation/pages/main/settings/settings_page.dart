import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            children: const [
              _ThemeDropDown(),
              _LanguageDropDown(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeDropDown extends StatelessWidget {
  const _ThemeDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (current, previous) =>
          current.activeTheme != previous.activeTheme,
      builder: (context, state) {
        return DropDown(
          key: const Key("dropdown_theme"),
          hint: Strings.of(context)!.chooseTheme,
          value: state.activeTheme,
          prefixIcon: const Icon(Icons.light),
          items: ThemeModeOptions.values
              .map(
                (data) => DropdownMenuItem(
                  value: data,
                  child: Text(
                    data.label(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<SettingsCubit>().updateTheme(value);
            }
          },
        );
      },
    );
  }
}

class _LanguageDropDown extends StatelessWidget {
  const _LanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.activeLanguage != current.activeLanguage,
      builder: (context, state) {
        return DropDown(
          key: const Key("dropdown_language"),
          hint: Strings.of(context)!.chooseLanguage,
          value: state.activeLanguage,
          prefixIcon: const Icon(Icons.language_outlined),
          items: LanguageOptions.values
              .map(
                (data) => DropdownMenuItem(
                  value: data,
                  child: Text(
                    data.label(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) async {
            if (value != null) {
              context.read<SettingsCubit>().updateLanguage(value);
            }
          },
        );
      },
    );
  }
}
