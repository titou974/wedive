import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveElevatedButtonTheme {
  WediveElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryBlue,
          foregroundColor: WediveColorsTheme.backgroundWhite,
          textStyle: TextStyle(
            fontSize: WediveSizes.fontSizeMd,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WediveSizes.buttonRadius),
          ),
        ),
      );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WediveColorsTheme.primaryPink, // Main primary
          foregroundColor: WediveColorsTheme.backgroundWhite,
          textStyle: TextStyle(
            fontSize: WediveSizes.fontSizeMd,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(WediveSizes.buttonRadius),
          ),
        ),
      );
}
