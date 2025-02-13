import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  
  colorScheme: ColorScheme.light(
    primary: Color(0xFF2973B2), // Deep Blue
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF9ACBD0), // Light Teal
    onPrimaryContainer: Colors.black,

    secondary: Color(0xFF48A6A7), // Teal
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF9ACBD0),
    onSecondaryContainer: Colors.black,

    surface: Color(0xFFF2EFE7), // Off-White Background
    onSurface: Colors.black,
  ),

  // 🎯 IconButton Theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFF2973B2)), // Primary color
      backgroundColor: WidgetStateProperty.all(Colors.transparent), // No background
      overlayColor: WidgetStateProperty.all(Color(0x802973B2)), // Light blue on press
    ),
  ),

  // ✏️ Text Theme
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),

    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),

    bodyLarge: TextStyle(fontSize: 14, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.black54),
  ),
);


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.dark(
    primary: Color(0xFF9ACBD0), // Light Teal
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF2973B2), // Deep Blue
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFF48A6A7), // Teal
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF2973B2),
    onSecondaryContainer: Colors.white,

    surface: Color(0xFF121212), // Dark Gray
    onSurface: Color(0xFFF2EFE7), // Off-White for readability
  ),

  // 🎯 IconButton Theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFF9ACBD0)), // Light Teal
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.all(Color(0x809ACBD0)), // Light teal on press
    ),
  ),

  // ✏️ Text Theme
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),

    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),

    bodyLarge: TextStyle(fontSize: 14, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.white70),
  ),
);

