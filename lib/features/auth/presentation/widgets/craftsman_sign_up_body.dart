import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_text_field_theme.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';

import 'package:san3a_app/core/utils/validators.dart';
import 'package:san3a_app/core/widgets/custom_button.dart';
import 'package:san3a_app/core/widgets/horizontal_gap.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/data/models/customer_sign_up_request_model.dart';
import 'package:san3a_app/features/auth/domain/repos/customer_sign_up_request_entity.dart';
import 'package:san3a_app/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:san3a_app/features/auth/presentation/widgets/auth_switch_widget.dart';
import 'package:san3a_app/features/auth/presentation/widgets/confirm_terms_and_conditions_sign_up.dart';
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
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(24),
          Row(
            children: [
              Expanded(
                child: LabeledDropdownFormField(
                  title: LocaleKeys.authCreateAccountCraftsmanSignupCraft,
                  isRequired: true,
                  hintText:
                      LocaleKeys.authCreateAccountCraftsmanSignupEnterCraft,
                  items: const [
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    "10",
                    "11",
                    "12",
                    "13",
                    "14",
                    "15",
                    "16",
                    "17",
                    "18",
                    "19",
                    "20",
                    "21",
                    "22",
                    "23",
                    "24",
                    "25",
                    "26",
                    "27",
                    "28",
                    "29",
                    "30",
                    "31",
                    "32",
                    "33",
                    "34",
                    "35",
                    "36",
                    "37",
                    "38",
                    "39",
                    "40",
                    "41",
                    "42",
                    "43",
                    "44",
                    "45",
                    "46",
                    "47",
                    "48",
                    "49",
                    "50",
                    "51",
                    "52",
                    "53",
                    "54",
                    "55",
                    "56",
                    "57",
                    "58",
                    "59",
                    "60",
                    "61",
                    "62",
                    "63",
                    "64",
                    "65",
                    "66",
                    "67",
                    "68",
                    "69",
                    "70",
                    "71",
                    "72",
                    "73",
                    "74",
                    "75",
                    "76",
                    "77",
                    "78",
                    "79",
                    "80",
                    "81",
                    "82",
                    "83",
                    "84",
                    "85",
                    "86",
                    "87",
                    "88",
                    "89",
                    "90",
                    "91",
                    "92",
                    "93",
                    "94",
                    "95",
                    "96",
                    "97",
                    "98",
                    "99",
                    "100",
                  ],
                  onChanged: (value) {},
                ),
              ),

              const HorizontalGap(17),
              const Expanded(
                child: LabeledFormField(
                  label: LocaleKeys.authCreateAccountCraftsmanSignupCraft,
                  hint: LocaleKeys.authCreateAccountCraftsmanSignupCraft,
                ),
              ),
            ],
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

class CustomDropdownFormField extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final String? helperText;
  final ValueChanged<String?>? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const CustomDropdownFormField({
    super.key,
    required this.items,
    required this.hintText,
    this.helperText,
    this.onChanged,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final AppTextFieldTheme appTextFieldTheme = Theme.of(
      context,
    ).extension<AppTextFieldTheme>()!;
    final textPalette = getTextPalette(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        onChanged: onChanged,
        hint: Text(
          hintText.tr(),
          style: AppTextStyles.getTextStyle(
            14,
          ).copyWith(color: textPalette.helperColor),
        ),
        style: AppTextStyles.getTextStyle(
          14,
        ).copyWith(color: textPalette.primaryColor),
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(left: 6.r, right: 7.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              width: 1.r,
              color: appTextFieldTheme.borderColor,
            ),
            color: appTextFieldTheme.highLightBackgroundColor,
          ),
        ),

        // iconStyleData: const IconStyleData(
        //   icon: Icon(Icons.arrow_drop_down),
        //   iconSize: 9 * 7,
        //   iconEnabledColor: Colors.yellow,
        //   iconDisabledColor: Colors.grey,
        // ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 192.h,
          width: 162.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: appTextFieldTheme.backgroundColor,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 46.h,
          // padding: EdgeInsets.only(left: 14, right: 14),
        ),

        items: items.map((value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),

        // dropdownColor: appTextFieldTheme.backgroundColor,

        // decoration: InputDecoration(
        //   helperText: helperText?.tr(),
        //   helperStyle: AppTextStyles.getTextStyle(
        //     12,
        //   ).copyWith(color: textPalette.helperColor),
        //   hintText: hintText.tr(),
        //   hintStyle: AppTextStyles.getTextStyle(
        //     14,
        //   ).copyWith(color: textPalette.helperColor),
        //   filled: true,
        //   fillColor: appTextFieldTheme.highLightBackgroundColor,
        //   contentPadding:
        //       contentPadding ??
        //       EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8.r),
        //     borderSide: BorderSide(
        //       width: 1.r,
        //       color: appTextFieldTheme.borderColor,
        //     ),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8.r),
        //     borderSide: BorderSide(
        //       width: 1.r,
        //       color: appTextFieldTheme.borderColor,
        //     ),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8.r),
        //     borderSide: BorderSide(
        //       width: 1.r,
        //       color: appTextFieldTheme.borderColor,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class LabeledDropdownFormField extends StatelessWidget {
  final String title;
  final bool isRequired;
  final String hintText;
  final String? helperText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const LabeledDropdownFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.isRequired = true,
    this.helperText,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title.tr(),
              style: AppTextStyles.getTextStyle(16).copyWith(
                fontWeight: FontWeight.w600,
                color: textPalette.primaryColor,
              ),
            ),
            if (isRequired)
              Text(
                "*",
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontWeight: FontWeight.w600,
                  color: textPalette.alertColor,
                ),
              ),
          ],
        ),
        const VerticalGap(16),
        CustomDropdownFormField(
          items: items,
          hintText: hintText,
          helperText: helperText,
          onChanged: onChanged,
          contentPadding: contentPadding,
        ),
      ],
    );
  }
}
