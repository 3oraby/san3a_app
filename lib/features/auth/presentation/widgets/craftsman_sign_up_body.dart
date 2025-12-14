import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/utils/validators.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/data/models/craftman_sign_up_request_model.dart';
import 'package:san3a_app/features/auth/domain/entities/craftman_sign_up_request_entity.dart';
import 'package:san3a_app/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:san3a_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:san3a_app/features/auth/presentation/widgets/confirm_terms_and_conditions_sign_up.dart';
import 'package:san3a_app/features/auth/presentation/widgets/craft_selection_section.dart';
import 'package:san3a_app/features/auth/presentation/widgets/labeled_form_field.dart';

class CraftsmanSignUpBody extends ConsumerStatefulWidget {
  const CraftsmanSignUpBody({super.key});

  @override
  ConsumerState<CraftsmanSignUpBody> createState() =>
      _CraftsmanSignUpBodyState();
}

class _CraftsmanSignUpBodyState extends ConsumerState<CraftsmanSignUpBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController craftController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTermsAndConditionsChecked = false;
  bool isSignUpButtonEnabled = false;
  String? selectedCraft;

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkFormFilled);
    emailController.addListener(checkFormFilled);
    governorateController.addListener(checkFormFilled);
    nationalIdController.addListener(checkFormFilled);
    passwordController.addListener(checkFormFilled);
    confirmPasswordController.addListener(checkFormFilled);
    craftController.addListener(checkFormFilled);
  }

  bool get isCraftValid {
    if (selectedCraft == null) return false;

    if (selectedCraft == LocaleKeys.craftOther.tr()) {
      return craftController.text.trim().isNotEmpty;
    }

    return true;
  }

  void checkFormFilled() {
    final isFilled =
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        governorateController.text.isNotEmpty &&
        nationalIdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        isTermsAndConditionsChecked &&
        isCraftValid;
    if (isFilled != isSignUpButtonEnabled) {
      setState(() {
        isSignUpButtonEnabled = isFilled;
      });
    }
  }

  void onCraftChanged(String? value) {
    setState(() {
      selectedCraft = value;
    });
    checkFormFilled();
  }

  void _onTermsAndConditionsChanged(bool value) {
    setState(() {
      isTermsAndConditionsChecked = value;
    });
    checkFormFilled();
  }

  String get finalCraft {
    if (selectedCraft == null) return '';
    if (selectedCraft == LocaleKeys.craftOther.tr()) {
      return craftController.text.trim();
    }
    return selectedCraft!;
  }

  void onCreateAccountPressed() {
    if (formKey.currentState!.validate()) {
      final CraftmanSignUpRequestEntity entity = CraftmanSignUpRequestEntity(
        name: nameController.text,
        craft: finalCraft,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: confirmPasswordController.text,
        nationalId: nationalIdController.text,
        governorate: governorateController.text,
      );

      final data = CraftmanSignUpRequestModel.fromEntity(entity).toJson();

      log(data.toString());
      ref.watch(signUpProvider.notifier).signUp(data: data);
    }
  }

  void onLoginButtonPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nationalIdController.dispose();
    governorateController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    craftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(24),
          CraftSelectionSection(
            selectedCraft: selectedCraft,
            onCraftChanged: onCraftChanged,
            craftController: craftController,
          ),
          const VerticalGap(16),
          LabeledFormField(
            controller: nameController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupName,
            hint: LocaleKeys.authCreateAccountCraftsmanSignupNameHint,
            validator: Validators.validateNormalText,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: emailController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupEmail,
            hint: LocaleKeys.authCreateAccountCraftsmanSignupEmailHint,
            validator: Validators.validateEmail,
          ),
          const VerticalGap(15),
          LabeledFormField(
            controller: nationalIdController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupNationalId,
            hint: LocaleKeys.authCreateAccountCraftsmanSignupNationalIdHint,
            keyboardType: TextInputType.number,
            validator: Validators.validateNationalId,
          ),
          const VerticalGap(15),
          LabeledFormField(
            controller: governorateController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupGovernorate,
            hint: LocaleKeys.authCreateAccountCraftsmanSignupGovernorateHint,
            validator: Validators.validateGovernorate,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: passwordController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupPassword,
            hint: LocaleKeys.authCreateAccountCraftsmanSignupPasswordHint,
            isPassword: true,
            validator: Validators.validatePassword,
          ),

          const VerticalGap(15),
          LabeledFormField(
            controller: confirmPasswordController,
            label: LocaleKeys.authCreateAccountCraftsmanSignupConfirmPassword,
            hint:
                LocaleKeys.authCreateAccountCraftsmanSignupConfirmPasswordHint,
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
            text: LocaleKeys.authCreateAccountCraftsmanSignupCreateAccountButton
                .tr(),
          ),
          const VerticalGap(16),
          AuthSwitchWidget(
            title: LocaleKeys.authCreateAccountCraftsmanSignupAlreadyHaveAccount
                .tr(),
            buttonDescription: LocaleKeys
                .authCreateAccountCraftsmanSignupLoginButton
                .tr(),
            onButtonPressed: onLoginButtonPressed,
          ),
        ],
      ),
    );
  }
}
