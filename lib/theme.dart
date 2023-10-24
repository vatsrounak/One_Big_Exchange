import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  brightness: Brightness.light, // Set the brightness to dark
  primaryColor: const Color(0xFFE5F64A), // Primary color as dark blue
  primaryColorLight: const Color(0xFFF3FAAC), // Lighter shade of blue
  primaryColorDark: const Color(0xFF101820), // Darker shade of blue
  canvasColor: const Color(0xFF101820), // Background color
  scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Scaffold background color
  indicatorColor: const Color(0xFFE5F64A), // Indicator color
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFE5F64A), // App bar background color
    titleTextStyle: TextStyle(
      color: Color(0xFF101820),
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedIconTheme: IconThemeData(color: Color(0xFFE5F64A)),
    selectedLabelStyle: TextStyle(color: Color(0xFFE5F64A)),
    unselectedIconTheme: IconThemeData(color: Colors.white),
    unselectedLabelStyle: TextStyle(color: Colors.white),
    unselectedItemColor: Colors.white,
    selectedItemColor: Color(0xFFE5F64A),
  ),
);