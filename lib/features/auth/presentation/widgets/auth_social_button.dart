import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/horizontal_gap.dart';

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    super.key,
    required this.description,
    required this.image,
    this.onPressed,
  });
  final String description;
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return CustomButton(
      backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
      onPressed: onPressed,
      isOutline: true,
      borderRadius: 21,
      borderColor: Theme.of(context).dividerColor,
      borderWidth: 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 16.h, width: 24.w),
          const HorizontalGap(12),
          Text(
            description,
            style: AppTextStyles.getTextStyle(11).copyWith(
              color: textPalette.darkBlueDesign,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
