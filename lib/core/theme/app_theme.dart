import 'package:aevon/core/theme/app_colors.dart';
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
    visualDensity: VisualDensity.adaptivePlatformDensity,
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
