import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/sub_classes/MyThemeData.dart';
import 'package:flutter/material.dart';


class CalculatorWidget extends StatelessWidget {
  CalculatorWidget({
    Key? key,
    required this.displayContainer,
    required this.ioHandler,
    required this.themeData,
  });

  final Widget displayContainer;
  final CalcDisplayIOHandleable ioHandler;
  final MyThemeData themeData;

  ThemeMode themeMode({required BuildContext context}) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  ButtonStyle buttonContrastStyle({required ThemeMode mode}) =>
      ElevatedButton.styleFrom(
        primary: this.themeData.primaryContrastColor(mode: mode),
      );

  ButtonStyle buttonSecondaryStyle({required ThemeMode mode}) =>
      ElevatedButton.styleFrom(
        primary: this.themeData.secondaryColor(mode: mode),
      );

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
