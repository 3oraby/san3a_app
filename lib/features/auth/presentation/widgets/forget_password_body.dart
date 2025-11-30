import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/utils/text_palette.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/custom_text_form_field.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textPalette = Theme.of(context).extension<TextPalette>()!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 19.w),
      child: Center(
        child: Column(
          children: [
            Text(
              LocaleKeys.authForgetPasswordResetPassword.tr(),
              style: AppTextStyles.getTextStyle(24).copyWith(
                fontWeight: FontWeight.w700,
                color: textPalette.primaryColor,
              ),
            ),
            const VerticalGap(32),
            Text(
              LocaleKeys.authForgetPasswordEnterEmail.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(16).copyWith(
                fontWeight: FontWeight.bold,
                color: textPalette.headingColor,
              ),
            ),
            const VerticalGap(10),
            Text(
              LocaleKeys.authForgetPasswordCodeWillBeSent.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(12).copyWith(
                fontWeight: FontWeight.bold,
                color: textPalette.tertiaryColor,
              ),
            ),
            const VerticalGap(89),
            const CustomTextFormField(),
            const VerticalGap(28),
            CustomButton(
              onPressed: () {},
              text: LocaleKeys.authForgetPasswordSendCode.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
