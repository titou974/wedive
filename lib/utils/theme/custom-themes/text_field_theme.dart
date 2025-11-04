import 'package:Wedive/utils/constants/colors.dart';
import 'package:Wedive/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WediveTextFieldTheme {
  WediveTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    errorMaxLines: 3,
    prefixIconColor: WediveColorsTheme.borderGrey,
    suffixIconColor: WediveColorsTheme.borderGrey,
    labelStyle: TextStyle().copyWith(
      fontSize: WediveSizes.fontSizeSm,
      color: WediveColorsTheme.borderGrey,
    ),
    hintStyle: TextStyle().copyWith(
      fontSize: WediveSizes.fontSizeSm,
      color: WediveColorsTheme.textBlack,
    ),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelStyle: TextStyle().copyWith(
      color: WediveColorsTheme.textBlack.withValues(alpha: 0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide(color: WediveColorsTheme.errorRed, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide(color: Colors.orange, width: 2.0),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade800,
    errorMaxLines: 3,
    prefixIconColor: WediveColorsTheme.borderGrey,
    suffixIconColor: WediveColorsTheme.borderGrey,
    labelStyle: TextStyle().copyWith(
      fontSize: WediveSizes.fontSizeSm,
      color: WediveColorsTheme.textWhite,
    ),
    hintStyle: TextStyle().copyWith(
      fontSize: WediveSizes.fontSizeSm,
      color: WediveColorsTheme.textWhite,
    ),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelStyle: TextStyle().copyWith(
      color: WediveColorsTheme.textWhite.withValues(alpha: 0.8),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide(color: WediveColorsTheme.errorRed, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(WediveSizes.inputFieldRadius),
      borderSide: BorderSide(color: Colors.orange, width: 2.0),
    ),
  );
}
