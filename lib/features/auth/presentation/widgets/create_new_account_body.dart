import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/expandable_page_view.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              SmoothPageIndicator(
                controller: pageController,
                count: 5,
                effect: const SlideEffect(),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
              const VerticalGap(24),
              ExpandablePageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
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

class ChooseRoleBody extends StatelessWidget {
  const ChooseRoleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      width: 100,
      color: Colors.amber,
      child: const Text("choose role"),
    );
  }
}

class CustomerSignUpBody extends StatelessWidget {
  const CustomerSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("customer sign up");
  }
}

class VendorSignUpBody extends StatelessWidget {
  const VendorSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("vendor sign up");
  }
}

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("verify email");
  }
}

class AccountCreatedSuccessBody extends StatelessWidget {
  const AccountCreatedSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("account created success");
  }
}
