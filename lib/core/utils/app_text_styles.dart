import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_commentary_app/core/utils/app_colors.dart';

abstract class AppTextStyles {
  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Font family
  static const String fontFamily = 'Montserrat';

  // Black text styles
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: bold,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: bold,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: bold,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: medium,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font12BlackRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: regular,
    color: AppColors.textPrimaryColor,
    fontFamily: fontFamily,
  );

  // White text styles
  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: bold,
    color: Colors.white,
    fontFamily: fontFamily,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: medium,
    color: Colors.white,
    fontFamily: fontFamily,
  );

  // Grey text styles
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    color: AppColors.textSecondaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font12GreyRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: regular,
    color: AppColors.textSecondaryColor,
    fontFamily: fontFamily,
  );

  // Primary color text styles
  static TextStyle font16PrimaryMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: medium,
    color: AppColors.primaryColor,
    fontFamily: fontFamily,
  );

  static TextStyle font14PrimaryMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: medium,
    color: AppColors.primaryColor,
    fontFamily: fontFamily,
  );
}

