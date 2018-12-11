import 'package:flutter/material.dart';

final ThemeData androidTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightGreen,
  accentColor: Colors.green,
  buttonColor: Colors.green
);

final ThemeData iOSTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.grey,
  accentColor: Colors.green,
  buttonColor: Colors.green
);

ThemeData getAdaptiveThemeData(context) {
  return Theme.of(context).platform == TargetPlatform.android ? androidTheme : iOSTheme;
}