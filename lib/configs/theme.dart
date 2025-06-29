import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 240),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: Color.fromARGB(255, 27, 27, 27),
  );
}
