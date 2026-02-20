import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 255, 56, 92); // Rausch
  static const Color background = Color(0xFFFFFFFF);
  static const Color text = Color(0xFF222222);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color action = Color(0xFFFF6B6B); // Coral

  // Status Indicators
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // UI Elements
  static const Color border = Color(0xFFE2E8F0);
  static const Color shadow = Color(0x14000000);

  static ThemeData light() {
    final base = ThemeData.light();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: primary,
        surface: background,
        onPrimary: Colors.white,
        onSurface: text,
      ),
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.plusJakartaSans(
          color: text,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(color: text, fontSize: 16),
        bodyMedium: GoogleFonts.plusJakartaSans(color: text, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 2,
        color: Colors.white,
      ),
    );
  }

  // Dark theme counterpart
  static ThemeData dark() {
    final base = ThemeData.dark();

    const Color darkBackground = Color(0xFF0B0B0D);
    const Color darkSurface = Color(0xFF121215);
    const Color darkText = Color(0xFFE6E6E6);
    const Color darkCard = Color(0xFF1B1B1D);

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFFFF385C),
        surface: darkSurface,
        onPrimary: Colors.white,
        onSurface: darkText,
      ),
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primary,
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          color: darkText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: darkText),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.plusJakartaSans(
          color: darkText,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: GoogleFonts.plusJakartaSans(
          color: darkText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(color: darkText, fontSize: 16),
        bodyMedium: GoogleFonts.plusJakartaSans(color: darkText, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 2,
        color: darkCard,
      ),
      canvasColor: darkSurface,
    );
  }
}
