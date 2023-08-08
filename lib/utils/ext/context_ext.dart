import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {

  dynamic back([dynamic result]) => Navigator.pop(this, result);

  double widthInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery
        .of(this)
        .size
        .width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;

    return MediaQuery
        .of(this)
        .size
        .height * toDouble;
  }
}
