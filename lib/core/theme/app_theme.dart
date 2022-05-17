import 'package:flutter/material.dart';
class AppTheme {


  static const Color lightPrimaryColor = Color(0xFFAA9EF9);
  static const Color lightAccentColor = Color(0xFFd6d0ff);
  static final lightTheme = ThemeData(
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    platform: TargetPlatform.iOS,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccentColor,
      primary: lightPrimaryColor,
    ),
  );

  AppTheme._();
}
