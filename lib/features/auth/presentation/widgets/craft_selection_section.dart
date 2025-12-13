import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:san3a_app/core/constants/crafts_list.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/widgets/horizontal_gap.dart';
import 'package:san3a_app/features/auth/presentation/widgets/labeled_dropdown_form_field.dart';
import 'package:san3a_app/features/auth/presentation/widgets/labeled_form_field.dart';

class CraftSelectionSection extends StatelessWidget {
  const CraftSelectionSection({
    super.key,
    required this.selectedCraft,
    required this.onCraftChanged,
    required this.craftController,
  });

  final String? selectedCraft;
  final ValueChanged<String?> onCraftChanged;
  final TextEditingController craftController;

  bool get isOtherSelected => selectedCraft == LocaleKeys.craftOther.tr();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledDropdownFormField(
                title: LocaleKeys.authCreateAccountCraftsmanSignupCraft,
                isRequired: true,
                selectedValue: selectedCraft,
                hintText: LocaleKeys.authCreateAccountCraftsmanSignupEnterCraft,
                items: CraftsList.allCrafts.map((craft) => craft.tr()).toList(),
                onChanged: (value) {
                  onCraftChanged(value);

                  if (value != LocaleKeys.craftOther.tr()) {
                    craftController.clear();
                  }
                },
              ),
            ),
            const HorizontalGap(17),
            Expanded(
              child: Visibility(
                visible: isOtherSelected,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: LabeledFormField(
                  controller: craftController,
                  label: LocaleKeys.authCreateAccountCraftsmanSignupWriteCraft,
                  hint: LocaleKeys.authCreateAccountCraftsmanSignupSampleCraft,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
