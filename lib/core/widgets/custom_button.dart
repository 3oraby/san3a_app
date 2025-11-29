import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 48,
    this.width,
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.textFontSize = 16,
    this.isOutline = false,
    this.isDisabled = false,
    this.borderColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double? width;
  final double borderRadius;
  final double borderWidth;
  final double textFontSize;
  final bool isOutline;
  final bool isDisabled;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final appSemanticColors = getTextPalette(context);

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          side: BorderSide(
            color: isOutline
                ? borderColor ?? Theme.of(context).primaryColor
                : Colors.transparent,
            width: borderWidth.r,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.getTextStyle(textFontSize).copyWith(
            color: textColor ?? appSemanticColors.contentBackgroundColor,
          ),
        ),
      ),
    );
  }
}
