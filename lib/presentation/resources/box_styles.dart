import 'package:flutter/material.dart';

import 'resources.dart';

class BoxDecorations {
  BoxDecorations._();

  static BoxDecoration button = const BoxDecoration(
    color: Palette.primary,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.button],
  );
}

class BoxShadows {
  BoxShadows._();

  static const BoxShadow button = BoxShadow(
    color: Palette.black20,
    blurRadius: 16.0,
    spreadRadius: 1.0,
  );
}
