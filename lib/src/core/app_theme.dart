import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/core.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    //HEADLINE
    headlineLarge: TextStyle(
        fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineMedium: TextStyle(fontSize: 12.sp, color: AppColors.white),

    //BODY
    bodyLarge: TextStyle(
        fontSize: 12.sp, color: AppColors.black, fontWeight: FontWeight.w400),

    bodyMedium: TextStyle(
        fontSize: 13.sp, color: AppColors.black, fontWeight: FontWeight.w500),

    //LABEL
    labelLarge: TextStyle(
        fontSize: 14.sp, color: AppColors.white, fontWeight: FontWeight.w600),

    //SEARCH LABEL
    labelSmall: TextStyle(fontSize: 11.sp, color: const Color(0xFF5F6E7C)),
  );

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Poppins',
    textTheme: textTheme,
    primaryTextTheme: textTheme,
  );
}
