import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class WediveChipTheme {
  WediveChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: WediveColorsTheme.borderGrey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: WediveColorsTheme.textBlack),
    selectedColor: WediveColorsTheme.chipBlue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WediveColorsTheme.textWhite,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: WediveColorsTheme.borderGrey,
    labelStyle: const TextStyle(color: WediveColorsTheme.textWhite),
    selectedColor: WediveColorsTheme.chipBlue,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WediveColorsTheme.textWhite,
  );
}
