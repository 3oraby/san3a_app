import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/constants/storage_keys.dart';
import 'package:san3a_app/core/enums/role.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';

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
          onTap: () => onRoleSelected(Role.craftsman),
        ),
      ],
    );
  }
}

class UserRoleCard extends StatelessWidget {
  const UserRoleCard({
    super.key,
    required this.role,
    required this.description,
    required this.onTap,
  });

  final String role;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 215.h,
        width: 227.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            const VerticalGap(48),
            Text(
              role.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.getTextStyle(32).copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const VerticalGap(24),
            RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                description.tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.getTextStyle(
                  16,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const VerticalGap(39),
          ],
        ),
      ),
    );
  }
}
