import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class WediveTextTheme {
  WediveTextTheme._();

  static TextTheme lightTextTheme = GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.accentBlue,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textGrey,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: WediveColorsTheme.textBlack,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: WediveColorsTheme.textBlack,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textBlack.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.accentBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: WediveColorsTheme.textWhite,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textWhite,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textWhite.withValues(alpha: 0.5),
    ),
  );
}
