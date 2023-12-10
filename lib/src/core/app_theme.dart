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

    //LABEL
    labelLarge: TextStyle(
        fontSize: 14.sp, color: AppColors.white, fontWeight: FontWeight.w600),
  );

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Poppins',
    textTheme: textTheme,
    primaryTextTheme: textTheme,
  );
}
