import 'package:flutter/material.dart';
import 'package:flutter_sample/res/app_colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundDark1st,
    primaryColor: AppColors.backgroundDark1st,
    hintColor: AppColors.labelDarkL2,
    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColors.primaryDarkP1,
      onPrimary: AppColors.primaryDarkOnP,
      secondary: AppColors.secondaryDarkP1,
      onSecondary: AppColors.secondaryDarkOnSecondary,
    ),
    iconTheme: IconThemeData(color: AppColors.labelDarkL1),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight1st,
    primaryColor: AppColors.backgroundLight1st,
    hintColor: AppColors.labelLightL2,
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.primaryLightP1,
      onPrimary: AppColors.primaryLightOnP,
      secondary: AppColors.secondaryLightP1,
      onSecondary: AppColors.secondaryLightOnSecondary,
    ),
    iconTheme: IconThemeData(color: AppColors.labelLightL1),
  );
}
