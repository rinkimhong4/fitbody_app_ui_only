import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const dark = Color(0xFF232323);
  static const neonYellow = Color(0xFFE2F163);
  static const primaryPurple = Color(0xFF896CFE);
  static const secondaryPurple = Color(0xFFB3A0FF);
}

class AppTextStyles {
  static final headlineLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static final titleLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final titleMedium = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final titleSmall = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static final bodyLarge = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final bodyMedium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static final descriptionLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final descriptionMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final descriptionSmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.dark,
        ),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.dark),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.dark),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.dark),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.dark),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.white,
        ),
        titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
      ),
    );
  }
}
