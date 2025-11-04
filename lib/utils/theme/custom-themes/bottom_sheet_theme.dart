import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WediveBottomSheetTheme {
  WediveBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: WediveColorsTheme.backgroundWhite,
    modalBackgroundColor: WediveColorsTheme.backgroundWhite,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WediveSizes.cardRadiusMd),
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: WediveColorsTheme.textBlack,
    modalBackgroundColor: WediveColorsTheme.textBlack,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(WediveSizes.cardRadiusMd),
    ),
  );
}
