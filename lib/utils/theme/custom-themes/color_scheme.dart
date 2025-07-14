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
    surface: WediveColorsTheme.textBlack,
    onSurface: WediveColorsTheme.textBlack,
    error: WediveColorsTheme.errorRed,
    onError: WediveColorsTheme.textWhite,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: WediveColorsTheme.accentBlue,
    onPrimary: WediveColorsTheme.accentBlue,
    secondary: WediveColorsTheme.primaryBlue,
    onSecondary: WediveColorsTheme.textBlack,
    surface: WediveColorsTheme.textBlack,
    onSurface: WediveColorsTheme.textWhite,
    error: WediveColorsTheme.errorRed,
    onError: WediveColorsTheme.textBlack,
  );
}
