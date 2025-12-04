import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/helpers/get_text_palette.dart';
import 'package:san3a_app/core/utils/app_text_field_theme.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.controller,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.hintTextStyle,
    this.helperTextStyle,
    this.labelTextStyle,
  });

  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AutovalidateMode autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? helperTextStyle;
  final TextStyle? labelTextStyle;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final appTextFieldTheme = Theme.of(context).extension<AppTextFieldTheme>()!;
    final textPalette = getTextPalette(context);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: isObscure,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: AppTextStyles.getTextStyle(
        16,
      ).copyWith(color: textPalette.headingColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: appTextFieldTheme.backgroundColor,
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: widget.labelTextStyle,
        hintStyle: widget.hintTextStyle,
        helperStyle: widget.helperTextStyle,
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21.r),
          borderSide: BorderSide(
            color: appTextFieldTheme.borderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21.r),
          borderSide: BorderSide(
            color: appTextFieldTheme.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21.r),
          borderSide: BorderSide(
            color: appTextFieldTheme.focusedBorderColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
