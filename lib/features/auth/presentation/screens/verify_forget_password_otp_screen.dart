import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';
import 'package:san3a_app/features/auth/presentation/widgets/verify_forget_password_otp_body.dart';

class VerifyForgetPasswordOtpScreen extends StatelessWidget {
  const VerifyForgetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackHelpAppBar(),
      body: VerifyForgetPasswordOtpBody(),
    );
  }
}
