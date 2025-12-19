import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:san3a_app/core/helpers/show_custom_snack_bar.dart';
import 'package:san3a_app/core/utils/app_routes.dart';
import 'package:san3a_app/core/utils/success.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';
import 'package:san3a_app/core/widgets/custom_modal_progress_hud.dart';
import 'package:san3a_app/features/auth/presentation/providers/reset_password_provider.dart';
import 'package:san3a_app/features/auth/presentation/widgets/reset_password_body.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  @override
  void dispose() {
    listenOnResetPasswordProvider();
    super.dispose();
  }

  void listenOnResetPasswordProvider() {
    ref.listen(resetPasswordProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString().tr());
      } else if (next is AsyncData && next.value is Success) {
        goToLoginScreen();
      }
    });
  }

  void goToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.initialAuthScreen,
      (route) => false,
    );
    Navigator.pushNamed(context, Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    listenOnResetPasswordProvider();
    return CustomModalProgressHUD(
      inAsyncCall: ref.watch(resetPasswordProvider).isLoading,
      child: const Scaffold(
        appBar: BackHelpAppBar(),
        body: ResetPasswordBody(),
      ),
    );
  }
}
