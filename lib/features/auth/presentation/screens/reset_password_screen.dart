import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';
import 'package:san3a_app/features/auth/presentation/widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: BackHelpAppBar(), body: ResetPasswordBody());
  }
}
