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
    shape: Border(bottom: BorderSide(
      color: Colors.black,
      width: 2,
    )),
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
        side: const BorderSide(color: Colors.black,width: 1)
      ),
      padding: const EdgeInsets.all(10),
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      //backgroundColor: Colors.white,
    )
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.black,
    thickness: 1,
  ),
  drawerTheme: DrawerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0)),
    
  )

);