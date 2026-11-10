import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static const Color navy = AppColors.navy;
  static const Color mutedText = AppColors.mutedText;

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 15,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 13,
          color: AppColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontFamily: 'MyanmarKhyay',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
