import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveCheckboxTheme {
  WediveCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.primaryBlue; // Main primary color
      }
      return WediveColorsTheme.transparent; // Default color when not selected
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.backgroundWhite; // Main primary color
      }
      return WediveColorsTheme.textBlack; // Default color when not selected
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.primaryBlue; // Main primary color
      }
      return WediveColorsTheme.transparent; // Default color when not selected
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.backgroundWhite; // Main primary color
      }
      return WediveColorsTheme.textBlack; // Default color when not selected
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}
