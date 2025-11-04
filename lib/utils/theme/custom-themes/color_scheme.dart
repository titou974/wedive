import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveColorScheme {
  WediveColorScheme._();

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: WediveColorsTheme.primaryBlue,
    onPrimary: WediveColorsTheme.textWhite,
    secondary: WediveColorsTheme.accentBlue,
    onSecondary: WediveColorsTheme.textWhite,
    tertiary: WediveColorsTheme.secondaryBlue,
    onTertiary: WediveColorsTheme.textWhite,
    surface: WediveColorsTheme.textBlack,
    onSurface: WediveColorsTheme.textWhite,
    error: WediveColorsTheme.errorRed,
    onError: WediveColorsTheme.textWhite,
    surfaceContainer: WediveColorsTheme.textLightGrey,
    shadow: WediveColorsTheme.textBlack,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: WediveColorsTheme.primaryPink,
    onPrimary: WediveColorsTheme.textWhite,
    secondary: WediveColorsTheme.secondaryBlue,
    onSecondary: WediveColorsTheme.textBlack,
    tertiary: WediveColorsTheme.secondaryBlue,
    onTertiary: WediveColorsTheme.textWhite,
    surface: WediveColorsTheme.textWhite,
    onSurface: WediveColorsTheme.textWhite,
    error: WediveColorsTheme.errorRed,
    onError: WediveColorsTheme.textBlack,
    surfaceContainer: WediveColorsTheme.textLightGrey,
    shadow: WediveColorsTheme.textBlack,
  );
}
