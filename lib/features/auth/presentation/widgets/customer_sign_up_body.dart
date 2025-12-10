import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/helpers/show_custom_snack_bar.dart';

import 'package:san3a_app/core/utils/validators.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/data/models/customer_sign_up_request_model.dart';
import 'package:san3a_app/features/auth/domain/repos/customer_sign_up_request_entity.dart';
import 'package:san3a_app/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:san3a_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:san3a_app/features/auth/presentation/widgets/confirm_terms_and_conditions_sign_up.dart';
import 'package:san3a_app/features/auth/presentation/widgets/labeled_form_field.dart';

class CustomerSignUpBody extends ConsumerStatefulWidget {
  const CustomerSignUpBody({super.key});

  @override
  ConsumerState<CustomerSignUpBody> createState() => _CustomerSignUpBodyState();
}

class _CustomerSignUpBodyState extends ConsumerState<CustomerSignUpBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTermsAndConditionsChecked = false;
  bool isSignUpButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkFormFilled);
    emailController.addListener(checkFormFilled);
    governorateController.addListener(checkFormFilled);
    nationalIdController.addListener(checkFormFilled);
    passwordController.addListener(checkFormFilled);
    confirmPasswordController.addListener(checkFormFilled);
  }

  void checkFormFilled() {
    final isFilled =
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        governorateController.text.isNotEmpty &&
        nationalIdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        isTermsAndConditionsChecked;
    if (isFilled != isSignUpButtonEnabled) {
      setState(() {
        isSignUpButtonEnabled = isFilled;
      });
    }
  }

  void _onTermsAndConditionsChanged(bool value) {
    setState(() {
      isTermsAndConditionsChecked = value;
    });
    checkFormFilled();
  }

  void onCreateAccountPressed() {
    if (formKey.currentState!.validate()) {
      final CustomerSignUpRequestEntity customerSignUpRequestEntity =
          CustomerSignUpRequestEntity(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            passwordConfirm: confirmPasswordController.text,
            nationalId: nationalIdController.text,
            governorate: governorateController.text,
          );

      final data = CustomerSignUpRequestModel.fromEntity(
        customerSignUpRequestEntity,
      ).toJson();
      ref.watch(signUpProvider.notifier).signUp(data: data);

      log("Form is valid");
    }
  }

  void onLoginButtonPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.removeListener(checkFormFilled);
    emailController.removeListener(checkFormFilled);
    nationalIdController.removeListener(checkFormFilled);
    governorateController.removeListener(checkFormFilled);
    passwordController.removeListener(checkFormFilled);
    confirmPasswordController.removeListener(checkFormFilled);

    nameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    governorateController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpProvider, (previous, next) {
      log("previous: $previous");
      log("next: $next");
      if (next.hasError) {
        showCustomSnackBar(context, next.error.toString());
      } else if (next.hasValue &&
          !next.isLoading &&
          previous?.hasValue != next.hasValue) {
        showCustomSnackBar(context, "success");
      }
    });
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(24),
          LabeledFormField(
            controller: nameController,
            label: LocaleKeys.authCreateAccountCustomerSignupName,
            hint: LocaleKeys.authCreateAccountCustomerSignupNameHint,
            validator: Validators.validateNormalText,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: emailController,
            label: LocaleKeys.authCreateAccountCustomerSignupEmail,
            hint: LocaleKeys.authCreateAccountCustomerSignupEmailHint,
            validator: Validators.validateEmail,
          ),
          const VerticalGap(15),
          LabeledFormField(
            controller: nationalIdController,
            label: LocaleKeys.authCreateAccountCustomerSignupNationalId,
            hint: LocaleKeys.authCreateAccountCustomerSignupNationalIdHint,
            keyboardType: TextInputType.number,
            validator: Validators.validateNationalId,
          ),
          const VerticalGap(15),
          LabeledFormField(
            controller: governorateController,
            label: LocaleKeys.authCreateAccountCustomerSignupGovernorate,
            hint: LocaleKeys.authCreateAccountCustomerSignupGovernorateHint,
            validator: Validators.validateGovernorate,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: passwordController,
            label: LocaleKeys.authCreateAccountCustomerSignupPassword,
            hint: LocaleKeys.authCreateAccountCustomerSignupPasswordHint,
            isPassword: true,
            validator: Validators.validatePassword,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: confirmPasswordController,
            label: LocaleKeys.authCreateAccountCustomerSignupConfirmPassword,
            hint: LocaleKeys.authCreateAccountCustomerSignupConfirmPasswordHint,
            isPassword: true,
            validator: (value) => Validators.confirmPasswordValidator(
              value,
              passwordController.text,
            ),
          ),

          const VerticalGap(16),
          ConfirmTermsAndConditionsSignUp(
            initialValue: false,
            onChanged: _onTermsAndConditionsChanged,
          ),
          const VerticalGap(25),
          CustomButton(
            isDisabled: !isSignUpButtonEnabled,
            onPressed: onCreateAccountPressed,
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
            onButtonPressed: onLoginButtonPressed,
          ),
        ],
      ),
    );
  }
}
