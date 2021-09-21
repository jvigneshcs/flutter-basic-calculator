import 'package:flutter/material.dart';

@immutable
class MyThemeData {
  MyThemeData({
    required this.themeDataLight,
    required this.themeDataDark,
    required this.primaryContrastColorLight,
    required this.primaryContrastColorDark,
    required this.secondaryColorLight,
    required this.secondaryColorDark,
  });

  final ThemeData themeDataLight;
  final ThemeData themeDataDark;
  final Color primaryContrastColorLight;
  final Color primaryContrastColorDark;
  final Color secondaryColorLight;
  final Color secondaryColorDark;

  Color primaryContrastColor({required ThemeMode mode}) {
    return mode == ThemeMode.light
        ? this.primaryContrastColorLight
        : this.primaryContrastColorDark;
  }

  Color secondaryColor({required ThemeMode mode}) {
    return mode == ThemeMode.light
        ? this.secondaryColorLight
        : this.secondaryColorDark;
  }
}
