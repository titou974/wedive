import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WediveOutlinedButtonTheme {
  WediveOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: WediveColorsTheme.accentBlue,
          side: const BorderSide(color: WediveColorsTheme.accentBlue),
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

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: WediveColorsTheme.textWhite,
          side: const BorderSide(color: WediveColorsTheme.textWhite),
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
