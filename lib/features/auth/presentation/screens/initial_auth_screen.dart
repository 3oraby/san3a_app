import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:san3a_app/core/constants/locale_keys.dart';
import 'package:san3a_app/core/utils/app_images.dart';
import 'package:san3a_app/core/utils/app_semantic_colors.dart';
import 'package:san3a_app/core/utils/app_svgs.dart';
import 'package:san3a_app/core/utils/app_text_styles.dart';
import 'package:san3a_app/core/widgets/vertical_gap.dart';

class InitialAuthScreen extends StatelessWidget {
  const InitialAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSemanticColors = Theme.of(context).extension<AppSemanticColors>()!;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgs.san3aLogo),
          Image.asset(AppImages.initialAuthLogo),
          VerticalGap(27),
          Text(
            LocaleKeys.authInitialLetStart.tr(),
            style: AppTextStyles.getTextStyle(32).copyWith(
              fontWeight: FontWeight.w700,
              color: appSemanticColors.headingColor,
            ),
          ),
          VerticalGap(12),
          Text(
            LocaleKeys.authInitialBestCraftsmenTitle.tr(),
            style: AppTextStyles.getTextStyle(12).copyWith(
              fontWeight: FontWeight.w400,
              color: appSemanticColors.headingColor,
            ),
          ),
        ],
      ),
    );
  }
}
