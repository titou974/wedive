import 'package:flutter/material.dart';
import 'custom-themes/text_theme.dart';
import 'custom-themes/elevated_button_theme.dart';
import 'custom-themes/color_scheme.dart';
import 'custom-themes/outlined_button_theme.dart';
import '../constants/colors.dart';
import 'custom-themes/appbar_theme.dart';
import 'custom-themes/checkbox_theme.dart';
import 'custom-themes/bottom_sheet_theme.dart';
import 'custom-themes/text_field_theme.dart';

class WediveTheme {
  WediveTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    scaffoldBackgroundColor: WediveColorsTheme.backgroundWhite,
    colorScheme: WediveColorScheme.lightColorScheme,
    elevatedButtonTheme: WediveElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: WediveOutlinedButtonTheme.lightOutlinedButtonTheme,
    textTheme: WediveTextTheme.lightTextTheme,
    appBarTheme: WediveAppBarTheme.lightAppBarTheme,
    checkboxTheme: WediveCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: WediveBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: WediveTextFieldTheme.lightInputDecorationTheme,
  ); // <-- semicolon here

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    colorScheme: WediveColorScheme.darkColorScheme,
    elevatedButtonTheme: WediveElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: WediveOutlinedButtonTheme.darkOutlinedButtonTheme,
    textTheme: WediveTextTheme.darkTextTheme,
    appBarTheme: WediveAppBarTheme.darkAppBarTheme,
    checkboxTheme: WediveCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: WediveBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: WediveTextFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor:
          WediveColorsTheme.textWhite, // Use a color that fits your theme
    ), // <-- Add this line
  ); // <-- semicolon here
}
