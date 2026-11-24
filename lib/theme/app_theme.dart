import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFFF5F5FA);
  static const ink = Color(0xFF16163A);
  static const muted = Color(0xFF5B5B7B);
  static const primary = Color.fromARGB(255, 51, 48, 112);
  static const primaryDark = Color.fromARGB(255, 51, 48, 112);
  static const primarySoft = Color(0xFFEEEDFD);
  static const onPrimarySoft = Color(0xFFE3E2FF);
  static const border = Color(0xFFE4E4F0);
  static const amber = Color(0xFFFBBF24);
  static const amberSoft = Color(0xFFFEF3C7);
  static const amberInk = Color(0xFF8A4A06);
  static const orange = Color(0xFFF97316);
}

class AppTheme {
  /// Headings use Plus Jakarta Sans, body text uses Inter.
  static TextStyle heading(double size, {Color color = AppColors.ink}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: size,
      fontWeight: FontWeight.w800,
      color: color,
      height: 1.15,
    );
  }

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surface: Colors.white,
      ).copyWith(primary: AppColors.primary),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.ink,
        displayColor: AppColors.ink,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: heading(18),
        iconTheme: const IconThemeData(color: AppColors.ink),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        indicatorColor: AppColors.primarySoft,
        height: 72,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
