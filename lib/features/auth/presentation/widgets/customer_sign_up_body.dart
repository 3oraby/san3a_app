import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:san3a_app/features/auth/presentation/widgets/confirm_terms_and_conditions_sign_up.dart';
import 'package:san3a_app/features/auth/presentation/widgets/labeled_form_field.dart';

class CustomerSignUpBody extends StatelessWidget {
  const CustomerSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalGap(24),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupName,
          hint: LocaleKeys.authCreateAccountCustomerSignupNameHint,
        ),

        const VerticalGap(15),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupEmail,
          hint: LocaleKeys.authCreateAccountCustomerSignupEmailHint,
        ),
        const VerticalGap(15),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupNationalId,
          hint: LocaleKeys.authCreateAccountCustomerSignupNationalIdHint,
        ),
        const VerticalGap(15),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupGovernorate,
          hint: LocaleKeys.authCreateAccountCustomerSignupGovernorateHint,
        ),

        const VerticalGap(15),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupPassword,
          hint: LocaleKeys.authCreateAccountCustomerSignupPasswordHint,
          isPassword: true,
        ),

        const VerticalGap(15),
        const LabeledFormField(
          label: LocaleKeys.authCreateAccountCustomerSignupConfirmPassword,
          hint: LocaleKeys.authCreateAccountCustomerSignupConfirmPasswordHint,
          isPassword: true,
        ),

        const VerticalGap(16),
        ConfirmTermsAndConditionsSignUp(
          initialValue: false,
          onChanged: (value) {},
        ),
        const VerticalGap(25),
        CustomButton(
          onPressed: () {},
          text: LocaleKeys.authCreateAccountCustomerSignupCreateAccountButton
              .tr(),
        ),
        const VerticalGap(16),
        AuthSwitchWidget(
          title: LocaleKeys.authCreateAccountCustomerSignupAlreadyHaveAccount
              .tr(),
          buttonDescription: LocaleKeys
              .authCreateAccountCustomerSignupLoginButton
              .tr(),
          onButtonPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
