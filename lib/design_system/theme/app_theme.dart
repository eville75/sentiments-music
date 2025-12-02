import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundStart,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.text),
      ),
      textTheme: TextTheme(
        titleLarge: AppTypography.h1,
        titleMedium: AppTypography.h2,
        bodyMedium: AppTypography.body,
        bodySmall: AppTypography.body,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
      ),
    );
  }

  static BoxDecoration get backgroundGradient => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundStart,
            AppColors.backgroundEnd,
          ],
        ),
      );
}
