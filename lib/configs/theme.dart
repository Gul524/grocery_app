import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    disabledColor: Colors.grey.shade400,
    splashColor: Colors.green.shade100,
    scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 240),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorDark: Colors.white,
    primaryColorLight: Colors.black,
    disabledColor: Colors.grey.shade600,
    splashColor: Color.fromARGB(255, 50, 50, 50),
    scaffoldBackgroundColor: Color.fromARGB(255, 50, 50, 50),
  );
}
