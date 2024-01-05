import 'package:flutter/material.dart';

class MoviesAppTheme {
  static const Color primary = Colors.teal;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
