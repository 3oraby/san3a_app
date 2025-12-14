import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';
import 'package:san3a_app/features/auth/presentation/widgets/user_role_card.dart';

class ChooseRoleBody extends StatefulWidget {
  const ChooseRoleBody({super.key, this.onRoleSelected});
  final VoidCallback? onRoleSelected;

  @override
  State<ChooseRoleBody> createState() => _ChooseRoleBodyState();
}

class _ChooseRoleBodyState extends State<ChooseRoleBody> {
  Role selectedRole = Role.customer;

  void onRoleSelected(Role role) async {
    selectedRole = role;

    await AppStorageHelper.setString(StorageKeys.userRole, role.name);
    widget.onRoleSelected?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalGap(24),
        UserRoleCard(
          role: LocaleKeys.authCreateAccountChooseUserRoleCustomer,
          description:
              LocaleKeys.authCreateAccountChooseUserRoleCustomerDescription,
          onTap: () => onRoleSelected(Role.customer),
        ),
        const VerticalGap(24),
        UserRoleCard(
          role: LocaleKeys.authCreateAccountChooseUserRoleCraftsman,
          description:
              LocaleKeys.authCreateAccountChooseUserRoleCraftsmanDescription,
          onTap: () => onRoleSelected(Role.craftman),
        ),
      ],
    );
  }
}
