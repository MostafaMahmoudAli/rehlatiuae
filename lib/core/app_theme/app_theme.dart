import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rehlatyuae/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.textAndBackgroundColorButton,
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: AppColors.materialPrimary,
    //   backgroundColor: AppColors.white,
    // ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 32.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 16.sp,
        color: AppColors.backgroundWhite,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 12.sp,
        color: AppColors.textAndBackgroundColorButton,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 12.sp,
        color: AppColors.greySearchText,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 10.sp,
        color: AppColors.grey,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Switzer',
        fontSize: 10.sp,
        color: AppColors.whiteAppColor,
      ),
    ),
  );
}
