import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.cyan,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.normal, 
      fontFamily: 'Inter',
      ),
    displayLarge: TextStyle(
      fontSize: 22, 
      fontWeight: FontWeight.bold, 
      fontFamily: 'Inter',
      ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold, 
      fontSize: 22,
      fontFamily: 'Inter',
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide(color: Colors.black,width: 1)
      ),
      padding: EdgeInsets.all(10),
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      //backgroundColor: Colors.white,
    )
  )

);