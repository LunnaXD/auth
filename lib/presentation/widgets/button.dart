import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../models_forms/models_forms.dart';
import '../resources/resources.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final ButtonStatus status;

  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    ButtonStatus? status,
  })  : status = status ?? ButtonStatus.enabled,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    late Widget content;

    switch (status) {
      case ButtonStatus.enabled:
        content = _button(_theme, enabled: true);
        break;
      case ButtonStatus.disabled:
        content = _button(_theme, enabled: false);
        break;
      case ButtonStatus.inProgress:
        content = _progressIndicator();
        break;
      case ButtonStatus.success:
        content = _successIndicator();
        break;
    }

    return Container(
      constraints:
          BoxConstraints(minWidth: width ?? context.widthInPercent(100)),
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      height: Dimens.buttonH,
      decoration:
          BoxDecorations.button.copyWith(color: color ?? Palette.primary),
      child: content,
    );
  }

  Widget _button(ThemeData theme, {required bool enabled}) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: color ?? Palette.primary,
        foregroundColor: Palette.hint,
        padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.cornerRadius),
          ),
        ),
      ),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelLarge?.copyWith(color: Palette.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _progressIndicator() {
    return const CircularProgressIndicator();
  }

  Widget _successIndicator() {
    return const Icon(Icons.check, color: Palette.success);
  }
}
