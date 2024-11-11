import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
      textTheme: TextTheme(
          headlineSmall:
              TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.mainColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.sp),
          iconTheme: const IconThemeData(color: Colors.white),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)))));
}
