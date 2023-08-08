import 'package:flutter/material.dart';

import '../resources/resources.dart';

class SpacerHorizontal extends StatelessWidget {
  const SpacerHorizontal({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: value ?? Dimens.space8,
    );
  }
}
