import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFF18171C),
    primary: Color(0xFFA90140),
    secondary: Color(0xFF550120),
    tertiary: Colors.grey,
    error: Colors.red,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
);
