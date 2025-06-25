import 'package:flutter/material.dart';
import 'package:wedive/utils/theme/custom-themes/text_theme.dart';
import 'package:wedive/utils/theme/custom-themes/elevated_button_theme.dart';
import 'package:wedive/utils/theme/custom-themes/color_scheme.dart';
import 'package:wedive/utils/theme/custom-themes/outlined_button_theme.dart';
import 'package:wedive/utils/constants/colors.dart';
import 'package:wedive/utils/theme/custom-themes/appbar_theme.dart';
import 'package:wedive/utils/theme/custom-themes/checkbox_theme.dart';
import 'package:wedive/utils/theme/custom-themes/bottom_sheet_theme.dart';
import 'package:wedive/utils/theme/custom-themes/text_field_theme.dart';

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
  ); // <-- semicolon here
}
