import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/utils/app_dark_colors.dart';
import 'package:san3a_app/core/utils/app_light_colors.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/utils/text_palette.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.scaffoldBackgroundColor,
    dividerColor: AppLightColors.dividerColor,
    extensions: [
      TextPalette(
        primaryColor: AppLightColors.textPrimaryColor,
        secondaryColor: AppLightColors.textSecondaryColor,
        tertiaryColor: AppLightColors.textTertiaryColor,
        helperColor: AppLightColors.textHelperColor,
        headingColor: AppLightColors.headingColor,
        paragraphColor: AppLightColors.paragraphColor,
        labelColor: AppLightColors.labelColor,
        contentBackgroundColor: AppLightColors.textBackgroundColor,
        alertColor: Colors.red,
        darkBlueDesign: AppLightColors.textDarkBlueDesignColor,
      ),
    ],
    iconTheme: const IconThemeData(color: Color(0xFF0A73FF)),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppLightColors.primaryColor,
        onPrimary: AppLightColors.textBackgroundColor,
      ),
    ),
    disabledColor: AppLightColors.disabledButtonBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppLightColors.textFieldBackground,
      suffixIconColor: AppLightColors.paragraphColor,
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.headingColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
        borderSide: BorderSide(
          color: AppLightColors.textFieldBorderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
        borderSide: BorderSide(
          color: AppLightColors.textFieldBorderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
        borderSide: const BorderSide(
          color: AppLightColors.primaryColor,
          width: 2,
        ),
      ),
      hintStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppLightColors.headingColor),
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
    extensions: [
      TextPalette(
        primaryColor: AppDarkColors.textPrimaryColor,
        secondaryColor: AppDarkColors.textSecondaryColor,
        tertiaryColor: AppDarkColors.textTertiaryColor,
        helperColor: AppDarkColors.textHelperColor,
        headingColor: AppDarkColors.headingColor,
        paragraphColor: AppDarkColors.paragraphColor,
        labelColor: AppDarkColors.labelColor,
        contentBackgroundColor: AppDarkColors.textBackgroundColor,
        alertColor: Colors.red,
        darkBlueDesign: AppDarkColors.textDarkBlueDesignColor,
      ),
    ],
    iconTheme: const IconThemeData(color: Colors.white),
    disabledColor: AppDarkColors.disabledColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.textFieldBackground,
      suffixIconColor: AppDarkColors.paragraphColor,
      labelStyle: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: AppDarkColors.headingColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
        borderSide: BorderSide(
          color: AppDarkColors.textFieldBorderColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
        borderSide: BorderSide(
          color: AppDarkColors.textFieldBorderColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(21.r),
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
