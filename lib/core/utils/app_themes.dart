import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/utils/app_dark_colors.dart';
import 'package:san3a_app/core/utils/app_light_colors.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/utils/app_semantic_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.scaffoldBackgroundColor,
    dividerColor: AppLightColors.dividerColor,
    extensions: const [
      AppSemanticColors(
        headingColor: AppLightColors.headingColor,
        paragraphColor: AppLightColors.paragraphColor,
        labelColor: AppLightColors.labelColor,
        contentBackgroundColor: AppLightColors.contentBackgroundColor,
        alertColor: Colors.red,
      ),
    ],
    iconTheme: const IconThemeData(color: Color(0xFF0A73FF)),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppLightColors.textFieldBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppLightColors.borderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppLightColors.borderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppLightColors.primaryColor,
          width: 2,
        ),
      ),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.paragraphColor),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppLightColors.primaryColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppDarkColors.primaryColor,
    scaffoldBackgroundColor: AppDarkColors.scaffoldBackgroundColor,
    dividerColor: AppDarkColors.dividerColor,
    extensions: const [
      AppSemanticColors(
        headingColor: AppDarkColors.headingColor,
        paragraphColor: AppDarkColors.paragraphColor,
        labelColor: AppDarkColors.labelColor,
        contentBackgroundColor: AppDarkColors.contentBackgroundColor,
        alertColor: Colors.red,
      ),
    ],
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.textFieldBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppDarkColors.borderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppDarkColors.borderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: AppDarkColors.primaryColor,
          width: 2,
        ),
      ),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.paragraphColor),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppDarkColors.primaryColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
