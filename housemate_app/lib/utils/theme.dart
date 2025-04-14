import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.cyan,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 32, 
      fontWeight: FontWeight.normal, 
      fontFamily: 'Inter',
      )
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold, 
      fontSize: 22,
      fontFamily: 'Inter',
    )
  )

);