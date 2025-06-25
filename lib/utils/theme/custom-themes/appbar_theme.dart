import 'package:flutter/material.dart';

class WediveAppBarTheme {
  WediveAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}
