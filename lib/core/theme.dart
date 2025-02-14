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
      foregroundColor: WidgetStateProperty.all(
        Color(0xFF2973B2),
      ), // Primary color
      backgroundColor: WidgetStateProperty.all(
        Colors.transparent,
      ), // No background
      overlayColor: WidgetStateProperty.all(
        Color(0xFF48A6A7),
      ), // Light blue on press
    ),
  ),

  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      animationDuration: Duration(milliseconds: 10),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFFF2EFE7),
          ); // Selected state
        }
        return GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black,
        ); // Default unselected state
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
      padding: WidgetStateProperty.all(EdgeInsets.all(8)),
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

    titleLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
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
  dividerTheme: DividerThemeData(
    color: Color(0xFF48A6A7).withAlpha(100),
    indent: 16,
    endIndent: 16,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.dark(
    primary: Color(0xFF9ACBD0), // Light Teal for accents
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF2973B2), // Deep Blue for contrast
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFF48A6A7), // Teal remains for consistency
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF2973B2),
    onSecondaryContainer: Colors.white,

    surface: Color(0xFF121212), // Dark background
    onSurface: Colors.white,
    surfaceContainer: Color(0xFF1E1E1E), // Slightly lighter dark for depth
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF121212),
    backgroundColor: Color(0xFF9ACBD0),
    shape: CircleBorder(),
  ),

  // 🎯 IconButton Theme (Dark Mode)
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(
        Color(0xFF9ACBD0),
      ), // Light Teal for visibility
      backgroundColor: WidgetStateProperty.all(
        Colors.transparent,
      ), // No background
      overlayColor: WidgetStateProperty.all(
        Color(0xFF48A6A7),
      ), // Soft Teal on press
    ),
  ),

  // 🔳 Segmented Button Theme
  segmentedButtonTheme: SegmentedButtonThemeData(
    style: ButtonStyle(
      animationDuration: Duration(milliseconds: 10),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF121212),
          ); // Dark background for contrast
        }
        return GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.white,
        ); // Default light text
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0xFF9ACBD0); // Light Teal for selection
        }
        return Color(0xFF1E1E1E); // Dark background
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color(0xFF121212); // Dark mode contrast
        }
        return Colors.white; // Unselected text color
      }),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: WidgetStateProperty.all(BorderSide(style: BorderStyle.none)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      padding: WidgetStateProperty.all(EdgeInsets.all(8)),
    ),
  ),

  // ✏️ Text Theme (Same font sizes as Light Theme)
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

    titleLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),

    bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    bodyMedium: GoogleFonts.poppins(fontSize: 12, color: Colors.white70),

    labelMedium: GoogleFonts.poppins(fontSize: 18, color: Color(0xFF9ACBD0)),
    labelLarge: GoogleFonts.poppins(fontSize: 28, color: Color(0xFF9ACBD0)),
    labelSmall: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF9ACBD0)),
  ),
  dividerTheme: DividerThemeData(
    color: Color(0xFF48A6A7).withAlpha(100),
    indent: 16,
    endIndent: 16,
  ),
);
