import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/features/auth/presentation/widgets/choose_role_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/customer_sign_up_body.dart';
import 'package:san3a_app/features/auth/presentation/widgets/craftsman_sign_up_body.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late Role selectedRole;

  @override
  void initState() {
    super.initState();
    getUserRole();
  }

  getUserRole() {
    String? role = AppStorageHelper.getString(StorageKeys.userRole);
    if (role != null) {
      selectedRole = Role.values.firstWhere((element) => element.name == role);
    } else {
      selectedRole = Role.customer;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedRole == Role.customer) {
      return const CustomerSignUpBody();
    } else if (selectedRole == Role.craftman) {
      return const CraftsmanSignUpBody();
    } else {
      return const ChooseRoleBody();
    }
  }
}
