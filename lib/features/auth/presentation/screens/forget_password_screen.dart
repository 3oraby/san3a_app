import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';
import 'package:san3a_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:san3a_app/features/auth/presentation/widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(appBar: BackHelpAppBar(), body: ForgetPasswordBody()),
    );
  }
}
