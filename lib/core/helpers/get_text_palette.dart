import 'package:flutter/material.dart';
import 'package:san3a_app/core/utils/text_palette.dart';

TextPalette getTextPalette(BuildContext context) {
  return Theme.of(context).extension<TextPalette>()!;
}
