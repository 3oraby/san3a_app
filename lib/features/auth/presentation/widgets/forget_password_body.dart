import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_routes.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/custom_under_line_text_field.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(checkEmail);
  }

  void checkEmail() {
    final isFilled = emailController.text.isNotEmpty;
    if (isFilled != isButtonEnabled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    emailController.removeListener(checkEmail);
    emailController.dispose();
    super.dispose();
  }

  void onSendCodeTap() async {
    await AppStorageHelper.setString(
      StorageKeys.userEmail,
      emailController.text,
    );

    goToVerifyCodeScreen();
  }

  void goToVerifyCodeScreen() {
    Navigator.pushNamed(context, Routes.verifyForgetPasswordOtpScreen);
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const VerticalGap(45),
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
            CustomUnderLineTextField(controller: emailController),
            const VerticalGap(28),
            CustomButton(
              onPressed: onSendCodeTap,
              isDisabled: !isButtonEnabled,
              text: LocaleKeys.authForgetPasswordSendCode.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
