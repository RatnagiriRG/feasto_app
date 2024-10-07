import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFonts {
  static String get manropeLight => "Manrope-Light";
  static String get manropeRegular => "Manrope-Regular";
  static String get manropeMedium => " Manrope-Medium";
  static String get manropeSemiBold => "Manrope-SemiBold";
  static String get manropeBold => "Manrope-Bold";
  static String get manropeExtraBold => "Manrope-ExtraBold";
}

class ThemeTypography {
  static TextStyle get displayLarge => GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 26,
      );
  static TextStyle get displayMedium => GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );

  static TextStyle get displaySmall => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  static TextStyle get headlineLarge => GoogleFonts.manrope(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get headlineMedium => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 18,
      );
  static TextStyle get headlineSmall => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  static TextStyle get titleLarge => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle get titleMedium => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get titleSmall => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  static TextStyle get labelLarge => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle get labelMedium => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get labelSmall => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );

  static TextStyle get bodyLarge => GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
        fontSize: 17,
      );
  static TextStyle get bodyMedium => GoogleFonts.manrope(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get bodySmall => GoogleFonts.manrope(
        fontWeight: FontWeight.w300,
        fontSize: 12,
      );
}
