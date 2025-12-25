import 'package:flutter/material.dart';

class AppColors {
  // Primary colors - Balanced Teal Blue (60% - Professional, Calm, Vibrant)
  static const Color primary = Color(0xFF0891B2); // Cyan Teal
  static const Color primaryDark = Color(0xFF0E7490); // Darker Teal
  static const Color primaryLight = Color(0xFF06B6D4); // Lighter Cyan

  // Secondary colors - Clean White/Off-White (30% - Clarity, Peace)
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF8F9FA); // Off-White
  static const Color lightGray = Color(0xFFF1F3F5);

  // Accent colors - Light Orange (10% - Warmth, Energy, Friendly)
  static const Color accent = Color(0xFFFB923C); // Light Orange
  static const Color accentLight = Color(0xFFFDAA5C); // Lighter Orange
  static const Color accentDark = Color(0xFFF97316); // Medium Orange

  // Supporting colors
  static const Color mediumGray = Color(0xFF6C757D);
  static const Color darkGray = Color(0xFF343A40);

  // Status colors
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color warning = Color(0xFFFFA726); // Orange
  static const Color danger = Color(0xFFEF5350); // Red for alerts
  static const Color info = Color(0xFF42A5F5); // Blue for info

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A1A);

  // Legacy support (keeping old names for compatibility)
  static const Color accentVeryLight = Color(0xFFFFA48D);
}

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      tertiary: AppColors.accentLight,
      surface: AppColors.white,
      background: AppColors.backgroundLight,
      error: AppColors.danger,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    // Text Themes
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.darkGray,
      ),
      displayMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.darkGray,
      ),
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkGray,
      ),
      titleLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkGray,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGray,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.mediumGray,
      ),
      labelSmall: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.mediumGray,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(0),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGray,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.danger, width: 2),
      ),
      labelStyle: const TextStyle(
        color: AppColors.mediumGray,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(color: AppColors.mediumGray, fontSize: 14),
    ),

    // FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  // Dark Theme (optional for future)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accentLight,
      surface: Color(0xFF1E1E1E),
      background: AppColors.backgroundDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
  );
}
