import 'package:flutter/material.dart';

class PosAppTheme {
  static const primaryColor = Color(0xFFFF5C00);
  static const secondaryColor = Color(0xFF13C91B);
  static const tertiaryColor = Color(0xFF19191C);

  static const backgroundColor = Color(0xFF19191C);

  static const textColor = Color(0xFFFFFFFF);

  static const activeButtonColor1 = BoxDecoration(color: secondaryColor);

  static const activeButtonColor2 = BoxDecoration(color: primaryColor);

  static const ColorScheme lightColorScheme = ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
      brightness: Brightness.light,
      onPrimary: Color(0xFF19191C));

  static const ColorScheme darkColorScheme = ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: backgroundColor,
      brightness: Brightness.dark,
      onPrimary: Color(0xFFFFFFFF));
}

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      primary: PosAppTheme.primaryColor,
      secondary: PosAppTheme.secondaryColor,
      surface: Colors.white,
      brightness: Brightness.light,
      onPrimary: Color(0xFF19191C)),
  appBarTheme: const AppBarTheme(
    backgroundColor: PosAppTheme.primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xFF19191C))),
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      primary: PosAppTheme.primaryColor,
      secondary: PosAppTheme.secondaryColor,
      surface: PosAppTheme.backgroundColor,
      brightness: Brightness.dark,
      onPrimary: Color(0xFFFFFFFF)),
  appBarTheme: const AppBarTheme(
    backgroundColor: PosAppTheme.primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFFFFFFF),
    ),
  ),
);
