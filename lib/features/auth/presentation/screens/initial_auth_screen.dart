import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/helpers/get_app_semantic_colors.dart';
import 'package:san3a_app/core/utils/app_images.dart';
import 'package:san3a_app/core/utils/app_svgs.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';

class InitialAuthScreen extends StatelessWidget {
  const InitialAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSemanticColors = getAppSemanticColors(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppSvgs.san3aLogo),
              Image.asset(AppImages.initialAuthLogo),
              const VerticalGap(27),
              Text(
                LocaleKeys.authInitialLetStart.tr(),
                style: AppTextStyles.getTextStyle(32).copyWith(
                  fontWeight: FontWeight.w700,
                  color: appSemanticColors.headingColor,
                ),
              ),
              const VerticalGap(12),
              Text(
                LocaleKeys.authInitialBestCraftsmenTitle.tr(),
                style: AppTextStyles.getTextStyle(
                  12,
                ).copyWith(color: appSemanticColors.headingColor),
              ),
              const VerticalGap(25),
              RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Column(
                  children: [
                    CustomButton(
                      text: LocaleKeys.authInitialLoginButton.tr(),
                      onPressed: () {},
                    ),
                    const VerticalGap(7),
                    CustomButton(
                      text: LocaleKeys.authInitialCreateAccountButton.tr(),
                      backgroundColor: Colors.white,
                      textColor: Theme.of(context).primaryColor,

                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const VerticalGap(16),
              Text(
                LocaleKeys.authInitialCreateAccountAgreeText.tr(),
                style: AppTextStyles.getTextStyle(
                  12,
                ).copyWith(color: appSemanticColors.paragraphColor),
              ),
              Text(
                LocaleKeys.authInitialTermsAndConditions.tr(),
                style: AppTextStyles.getTextStyle(12).copyWith(
                  color: appSemanticColors.paragraphColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
    final appSemanticColors = getAppSemanticColors(context);

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
