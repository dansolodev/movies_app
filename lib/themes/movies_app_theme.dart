import 'package:flutter/material.dart';

class MoviesAppTheme {
  static const Color primary = Colors.teal;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
  );
}
