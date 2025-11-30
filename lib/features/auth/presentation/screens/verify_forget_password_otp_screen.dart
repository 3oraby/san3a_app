import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';

class VerifyForgetPasswordOtpScreen extends StatelessWidget {
  const VerifyForgetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHelpAppBar(),
      body: Center(
        child: Text(AppStorageHelper.getString(StorageKeys.userEmail) ?? ''),
      ),
    );
  }
}
