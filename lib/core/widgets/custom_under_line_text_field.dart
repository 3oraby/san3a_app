import 'package:flutter/material.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_dark_colors.dart';
import 'package:san3a_app/core/utils/app_light_colors.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return TextFormField(
      style: AppTextStyles.getTextStyle(
        20,
      ).copyWith(color: textPalette.headingColor),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? AppLightColors.textFieldBorderColor
                : AppDarkColors.textFieldBorderColor,
            width: 1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? AppLightColors.textFieldBorderColor
                : AppDarkColors.textFieldBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).brightness == Brightness.light
                ? AppLightColors.primaryColor
                : AppDarkColors.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
