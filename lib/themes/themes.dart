import 'package:flutter/material.dart';

// Define Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      fontSize: 20.0,  // Font size for headline6
      fontWeight: FontWeight.bold,
      color: Colors.black,  // Color for light theme
    ),
    bodyMedium: TextStyle(color: Colors.black),
  ),

);

// Define Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),

  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(
      fontSize: 20.0,  // Font size for headline6
      fontWeight: FontWeight.bold,
      color: Colors.white,  // Color for dark theme
    ),
  ),
);
