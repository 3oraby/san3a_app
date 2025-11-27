import 'package:flutter/material.dart';
import 'package:san3a_app/core/utils/app_semantic_colors.dart';

AppSemanticColors getAppSemanticColors(BuildContext context) {
  return Theme.of(context).extension<AppSemanticColors>()!;
}
