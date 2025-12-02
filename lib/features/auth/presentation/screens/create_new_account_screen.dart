import 'package:flutter/material.dart';
import 'package:san3a_app/core/widgets/back_help_app_bar.dart';
import 'package:san3a_app/features/auth/presentation/widgets/create_new_account_body.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackHelpAppBar(),
      body: CreateNewAccountBody(),
    );
  }
}
