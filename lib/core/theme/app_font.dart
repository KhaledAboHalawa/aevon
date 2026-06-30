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

  static TextStyle balooThambi2Regular({double? fontSize, Color? color}) => getBalooThambi2(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );

  static TextStyle balooThambi2Medium({double? fontSize, Color? color}) => getBalooThambi2(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );

  static TextStyle balooThambi2SemiBold ({required Color color, required double fontSize}) => getBalooThambi2(
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    color: color,
  );

  static TextStyle balooThambi2Bold({double? fontSize, Color? color}) => getBalooThambi2(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
    );
}
