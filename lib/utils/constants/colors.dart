import 'package:flutter/material.dart';

class WediveColorsTheme {
  WediveColorsTheme._();

  static const Color primaryBlue = Color(0xFF020063); // Main primary
  static const Color accentBlue = Color(0xFF322EFF); // Active button, highlight
  static const Color secondaryBlue = Color(
    0xFF659BFF,
  ); // Grade highlight, lighter accents
  static const Color chipBlue = Color.fromARGB(128, 41, 19, 234);
  static const Gradient linearGradient = LinearGradient(
    colors: [
      Color(0xFF020063), // Main primary color
      Color(0xFF322EFF), // Active button, highlight
    ],
    begin: Alignment.topLeft,
    end: Alignment(0.707, -0.707),
  );
  static const Color backgroundWhite = Color(0xFFFDFDFD);
  static const Color textBlack = Colors.black; // Main text color
  static const Color textWhite = Colors.white; // Main text color for dark model

  static const Color textGrey = Color(0xFF616161); // Secondary text color
  static const Color textLightGrey = Color(0xFFBDBDBD); // Tertiary text color
  static const Color textDarkGrey = Color(0xFF424242); // Darker
  static const Color transparent = Colors.transparent; // Transparent color
  static const Color errorRed = Colors.red;
}
