import 'package:calculator/src/models/sub_classes/MyThemeData.dart';
import 'package:calculator/src/widgets/stateful/MyHomePage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeData = MyThemeData(
      themeDataLight: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ),
      themeDataDark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      primaryContrastColorLight: Colors.indigoAccent,
      primaryContrastColorDark: Colors.redAccent,
      secondaryColorLight: Colors.blue,
      secondaryColorDark: Colors.teal[900]!,
    );
    return MaterialApp(
      title: 'Calculator',
      theme: themeData.themeDataLight,
      darkTheme: themeData.themeDataDark,
      themeMode: ThemeMode.system,
      home: MyHomePage(
        themeData: themeData,
      ),
    );
  }
}
