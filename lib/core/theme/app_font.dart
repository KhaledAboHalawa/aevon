import 'package:flutter/material.dart';

class AppFont {
  AppFont._();
  static const String balooThambi2 = 'BalooThambi2';

  static TextStyle getBalooThambi2({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) => TextStyle(
    fontFamily: balooThambi2,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );

  static TextStyle balooThambi2Regular({double? fontSize, Color? color}) {
    return getBalooThambi2(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }
}
