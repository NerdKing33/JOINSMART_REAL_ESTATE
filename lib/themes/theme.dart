import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade400,
    primary: Colors.white,
    secondary: const Color.fromRGBO(214, 0, 5, 1.0),
    tertiary: const Color.fromRGBO(255, 179, 0, 1.0),
  )
);

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: const Color.fromRGBO(214, 0, 5, 1.0),
      tertiary: const Color.fromRGBO(255, 179, 0, 1.0)
  )
);

Color lRed = const Color.fromRGBO(216,66, 73, 1.0);
Color pRed = const Color.fromRGBO(254, 235, 236, 1);