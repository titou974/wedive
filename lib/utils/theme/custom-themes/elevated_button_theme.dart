import 'package:flutter/material.dart';
import 'package:wedive/utils/constants/colors.dart';

class WediveElevatedButtonTheme {
  WediveElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryBlue, // Main primary
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
