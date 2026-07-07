import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.mainOrange,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainOrange,
      primary: AppColors.mainOrange,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.buttonGrey,
      selectionColor: AppColors.textGrey.withAlpha(128),
      selectionHandleColor: AppColors.lightOrange,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainOrange,
        foregroundColor: AppColors.buttonGrey,
        textStyle: AppFont.balooThambi2ExtraBold(fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.mainOrange,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainOrange,
      primary: AppColors.mainOrange,
    ),

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
