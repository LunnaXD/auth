import 'package:flutter/material.dart';

class MyAppBar {
  final String? title;
  final List<Widget>? actions;

  const MyAppBar({this.title, this.actions});

  PreferredSize call(BuildContext context) => PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(
      elevation: 0,
      title: Text(
        title ?? "-",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: actions,
    ),
  );
}