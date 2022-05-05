import 'package:flutter/material.dart';

final ThemeData KIOS = ThemeData(
  primarySwatch: Colors.orangeAccent[400],
  primaryColor: Colors.grey,
  primaryColorBrightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    brightness: Brightness.dark,
  )
);

final ThemeData KDefault = ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.blue,
  primaryColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.purple[200],
      brightness: Brightness.dark,
    )
);