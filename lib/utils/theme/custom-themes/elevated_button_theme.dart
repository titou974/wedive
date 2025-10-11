import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveElevatedButtonTheme {
  WediveElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryBlue,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          minimumSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryPink, // Main primary
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          minimumSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
