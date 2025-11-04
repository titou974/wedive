import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveCheckboxTheme {
  WediveCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.primaryBlue; // Main primary color
      }
      return WediveColorsTheme.textLightGrey.withValues(
        alpha: 0.3,
      ); // Default color when not selected
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return WediveColorsTheme.backgroundWhite; // Main primary color
      }
      return WediveColorsTheme.textBlack; // Default color when not selected
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WediveSizes.borderRadiusSm),
    ),
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WediveSizes.borderRadiusSm),
    ),
  );
}
