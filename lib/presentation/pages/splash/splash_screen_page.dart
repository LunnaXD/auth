import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootScaffold(
      child: ColoredBox(
        color: Palette.white,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Palette.primary,
            radius: Dimens.profilePicture + Dimens.space4,
            child: CircleAvatar(
              backgroundImage: AssetImage(Images.icLauncher),
              radius: Dimens.profilePicture,
            ),
          ),
        ),
      ),
    );
  }
}
