import 'package:flutter/material.dart';
import 'package:wedive/utils/constants/colors.dart';

class WediveOutlinedButtonTheme {
  WediveOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: WediveColorsTheme.accentBlue,
          side: const BorderSide(color: WediveColorsTheme.accentBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: WediveColorsTheme.accentBlue,
          side: const BorderSide(color: WediveColorsTheme.accentBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
