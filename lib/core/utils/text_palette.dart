import 'package:flutter/material.dart';

@immutable
class TextPalette extends ThemeExtension<TextPalette> {
  final Color primaryColor;
  final Color headingColor;
  final Color paragraphColor;
  final Color labelColor;
  final Color contentBackgroundColor;
  final Color alertColor;

  const TextPalette({
    required this.primaryColor,
    required this.headingColor,
    required this.paragraphColor,
    required this.labelColor,
    required this.contentBackgroundColor,
    required this.alertColor,
  });

  @override
  TextPalette copyWith({
    Color? primaryColor,
    Color? headingColor,
    Color? paragraphColor,
    Color? labelColor,
    Color? contentBackgroundColor,
    Color? alertColor,
  }) {
    return TextPalette(
      primaryColor: primaryColor ?? this.primaryColor,
      headingColor: headingColor ?? this.headingColor,
      paragraphColor: paragraphColor ?? this.paragraphColor,
      labelColor: labelColor ?? this.labelColor,
      contentBackgroundColor:
          contentBackgroundColor ?? this.contentBackgroundColor,
      alertColor: alertColor ?? this.alertColor,
    );
  }

  @override
  TextPalette lerp(ThemeExtension<TextPalette>? other, double t) {
    if (other is! TextPalette) {
      return this;
    }
    return TextPalette(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      headingColor: Color.lerp(headingColor, other.headingColor, t)!,
      paragraphColor: Color.lerp(paragraphColor, other.paragraphColor, t)!,
      labelColor: Color.lerp(labelColor, other.labelColor, t)!,
      contentBackgroundColor: Color.lerp(
        contentBackgroundColor,
        other.contentBackgroundColor,
        t,
      )!,
      alertColor: Color.lerp(alertColor, other.alertColor, t)!,
    );
  }
}
