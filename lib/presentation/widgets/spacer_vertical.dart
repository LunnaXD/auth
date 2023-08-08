import 'package:flutter/material.dart';

import '../resources/resources.dart';

class SpacerVertical extends StatelessWidget {
  const SpacerVertical({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.space8,
    );
  }
}
