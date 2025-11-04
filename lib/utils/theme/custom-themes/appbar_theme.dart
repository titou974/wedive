import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WediveAppBarTheme {
  WediveAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: WediveColorsTheme.transparent,
    surfaceTintColor: WediveColorsTheme.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    iconTheme: const IconThemeData(
      color: WediveColorsTheme.textBlack,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: WediveColorsTheme.textBlack,
      size: 24,
    ),
    titleTextStyle: const TextStyle(
      color: WediveColorsTheme.textBlack,
      fontSize: WediveSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: WediveColorsTheme.transparent,
    surfaceTintColor: WediveColorsTheme.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: WediveColorsTheme.textWhite,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: WediveColorsTheme.textWhite,
      size: 24,
    ),
    titleTextStyle: const TextStyle(
      color: WediveColorsTheme.textWhite,
      fontSize: WediveSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
    ),
  );
}
