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
    surfaceContainer: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFF2EFE7),
    backgroundColor: Color(0xFF2973B2),
    shape: CircleBorder(),
  ),

  // 🎯 IconButton Theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFF2973B2)), // Primary color
      backgroundColor: WidgetStateProperty.all(Colors.transparent), // No background
      overlayColor: WidgetStateProperty.all(Color(0xFF48A6A7)), // Light blue on press
    ),
  ),

  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      animationDuration: Duration(milliseconds: 10),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF2EFE7)); // Selected state
        }
        return GoogleFonts.poppins(fontSize: 14, color: Colors.black); // Default unselected state
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0xFF2973B2); // Selected state
        }
        return Color(0xFFF2EFE7); // Default unselected state
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0xFFF2EFE7); // Selected text color
        }
        return Colors.black; // Unselected text color
      }),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: WidgetStateProperty.all(BorderSide(style: BorderStyle.none)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      padding: WidgetStateProperty.all(EdgeInsets.all(4)),
    ),
  ),

  // ✏️ Text Theme
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

    titleLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),

    bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
    bodyMedium: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),

    labelMedium: GoogleFonts.poppins(fontSize: 18, color: Color(0xFFF2EFE7)),
    labelLarge: GoogleFonts.poppins(fontSize: 28, color: Color(0xFFF2EFE7)),
    labelSmall: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF2EFE7)),
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
    displayLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    titleLarge: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),

    bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    bodyMedium: GoogleFonts.poppins(fontSize: 12, color: Colors.white70),
  ),
);
