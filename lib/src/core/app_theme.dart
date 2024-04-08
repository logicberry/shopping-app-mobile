import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/core/core.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    //HEADLINE
    headlineLarge: TextStyle(
        fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineMedium: TextStyle(fontSize: 12.sp, color: AppColors.white),

    //BODY
    titleLarge: TextStyle(
        fontSize: 19.sp, color: AppColors.black, fontWeight: FontWeight.w600),

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

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontSize: 28.sp, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineMedium: TextStyle(fontSize: 12.sp, color: AppColors.white),
    titleLarge: TextStyle(
        fontSize: 19.sp, color: AppColors.white, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(
        fontSize: 12.sp, color: AppColors.white, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: 13.sp, color: AppColors.white, fontWeight: FontWeight.w500),
    labelLarge: TextStyle(
        fontSize: 14.sp, color: AppColors.white, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(fontSize: 11.sp, color: const Color(0xFF5F6E7C)),
  );

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.ash,
      fontFamily: 'Poppins',
      textTheme: lightTextTheme,
      cardColor: AppColors.white,
      primaryTextTheme: lightTextTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF06372E),
      fontFamily: 'Poppins',
      textTheme: darkTextTheme,
      primaryTextTheme: darkTextTheme,
      cardColor: const Color(0xFF0C4A3F),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF0C4A3F),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.white,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Color(0xFF0C4A3F)));
}
