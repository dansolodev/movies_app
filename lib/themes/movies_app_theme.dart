import 'package:flutter/material.dart';

class MoviesAppTheme {
  static const Color primary = Colors.teal;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
      ),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
