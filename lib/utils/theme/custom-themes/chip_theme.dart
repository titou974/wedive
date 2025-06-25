import 'package:flutter/material.dart';
import 'package:wedive/utils/constants/colors.dart';

class WediveChipTheme {
  WediveChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: WediveColorsTheme.textBlack),
    selectedColor: WediveColorsTheme.chipBlue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WediveColorsTheme.textWhite,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: WediveColorsTheme.textWhite),
    selectedColor: WediveColorsTheme.chipBlue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WediveColorsTheme.textWhite,
  );
}
