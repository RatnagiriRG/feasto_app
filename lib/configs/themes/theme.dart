import 'package:feasto/configs/themes/colors.dart';
import 'package:feasto/configs/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackGroundColor,
      centerTitle: true,
      elevation: 1,
    ),
    canvasColor: Colors.transparent,
    fontFamily: GoogleFonts.manrope.toString(),
    scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,

      //   brightness: Brightness.dark,
      //   primary: AppDarkColors.darkPrimaryColor,
      //   secondary: AppDarkColors.darkSecondaryColor,
      //   onSecondary: AppDarkColors.darkOnSecondaryColor,
      tertiary: AppColors.white,
      //   onTertiary: AppDarkColors.darkOnTertiaryColor,
      surface: AppColors.backGroundColor,
      //   onSurface: AppDarkColors.darkOnBackground,
      //   surfaceTint: AppDarkColors.darkHighlightColor,
      //   surfaceDim: AppDarkColors.darkSkeltonColor,
      //   error: AppDarkColors.darkErrorColor,
    ),
    // progressIndicatorTheme: ProgressIndicatorThemeData(
    //   color: AppDarkColors.darkPrimaryColor,
    // ),
    textTheme: TextTheme(
      displayLarge: ThemeTypography.displayLarge,
      displayMedium: ThemeTypography.displayMedium,
      displaySmall: ThemeTypography.displaySmall,
      headlineLarge: ThemeTypography.headlineLarge,
      headlineMedium: ThemeTypography.headlineMedium,
      headlineSmall: ThemeTypography.headlineSmall,
      titleLarge: ThemeTypography.titleLarge,
      titleMedium: ThemeTypography.titleMedium,
      titleSmall: ThemeTypography.titleSmall,
      labelLarge: ThemeTypography.labelLarge,
      labelMedium: ThemeTypography.labelMedium,
      labelSmall: ThemeTypography.labelSmall,
      bodyLarge: ThemeTypography.bodyLarge,
      bodyMedium: ThemeTypography.bodyMedium,
      bodySmall: ThemeTypography.bodySmall,
    ),
  );
}
