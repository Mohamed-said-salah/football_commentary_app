import 'package:flutter/material.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';
import 'package:football_commentary_app/core/utils/app_text_styles.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primarySwatch: Colors.green,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      titleTextStyle: AppTextStyles.font18WhiteBold,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.font16WhiteMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.font24BlackBold,
      displayMedium: AppTextStyles.font20BlackBold,
      displaySmall: AppTextStyles.font18BlackBold,
      headlineMedium: AppTextStyles.font16BlackMedium,
      bodyLarge: AppTextStyles.font14BlackRegular,
      bodyMedium: AppTextStyles.font12BlackRegular,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
    ),
  );
}

