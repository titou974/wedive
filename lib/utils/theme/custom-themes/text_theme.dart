import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class WediveTextTheme {
  WediveTextTheme._();

  static TextTheme lightTextTheme = GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSize2Xl,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSizeXl,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.accentBlue,
      fontSize: WediveSizes.fontSizeLg,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSize2Xl,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSizeXl,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSizeMd,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSizeLg,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textGrey,
      fontSize: WediveSizes.fontSizeMd,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: WediveColorsTheme.textBlack,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeXs,
      fontWeight: FontWeight.w600,
      color: WediveColorsTheme.textBlack,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textBlack.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = GoogleFonts.montserratTextTheme().copyWith(
    titleLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSize2Xl,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeXl,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.secondaryBlue,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSize2Xl,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeXl,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeMd,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeLg,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.montserrat(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeMd,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: WediveColorsTheme.textWhite,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textWhite,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontSize: WediveSizes.fontSizeXs,
      fontWeight: FontWeight.normal,
      color: WediveColorsTheme.textWhite.withValues(alpha: 0.5),
    ),
  );
}
