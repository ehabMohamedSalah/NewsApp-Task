import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/color_manager.dart';



class AppTheme{
  static ThemeData lightTheme = ThemeData(

        appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        centerTitle: true,
        iconTheme: IconThemeData(
        color: Colors.white,
        ),),

      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          primary: ColorManager.primaryColor,
        secondary: ColorManager.headlineColor,
      ),

      textTheme: TextTheme(
        bodyLarge:TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
          headlineLarge: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),
          headlineMedium: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
          labelMedium: TextStyle(
            overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp
          ),
          labelSmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: Colors.white
          ),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: ColorManager.headlineColor
        )
      )
  );
}