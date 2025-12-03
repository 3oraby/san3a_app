import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_light_colors.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/custom_step_indicator.dart';
import 'package:san3a_app/core/widgets/expandable_page_view.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/presentation/widgets/account_created_success_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/choose_role_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/customer_sign_up_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/vendor_sign_up_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/verify_email_body.dart';

class CreateNewAccountBody extends StatefulWidget {
  const CreateNewAccountBody({super.key});

  @override
  State<CreateNewAccountBody> createState() => _CreateNewAccountBodyState();
}

class _CreateNewAccountBodyState extends State<CreateNewAccountBody> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalGap(37),
              Text(
                LocaleKeys.createNewAccountTitle.tr(),
                style: AppTextStyles.getTextStyle(28).copyWith(
                  fontWeight: FontWeight.w700,
                  color: textPalette.primaryColor,
                ),
              ),
              const VerticalGap(32),
              AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return CustomStepIndicator(
                    count: 5,
                    currentIndex: pageController.hasClients
                        ? (pageController.page?.round() ?? 0)
                        : 0,
                    activeColor: textPalette.primaryColor,
                    inactiveColor: AppLightColors.inActiveIndicatorColor,
                  );
                },
              ),
              const VerticalGap(24),
              ExpandablePageView(
                controller: pageController,
                children: const [
                  ChooseRoleBody(),
                  CustomerSignUpBody(),
                  VendorSignUpBody(),
                  VerifyEmailBody(),
                  AccountCreatedSuccessBody(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
