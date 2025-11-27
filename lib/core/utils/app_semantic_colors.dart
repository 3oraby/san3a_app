import 'package:flutter/material.dart';

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  final Color headingColor;
  final Color paragraphColor;
  final Color labelColor;
  final Color contentBackgroundColor;
  final Color alertColor;

  const AppSemanticColors({
    required this.headingColor,
    required this.paragraphColor,
    required this.labelColor,
    required this.contentBackgroundColor,
    required this.alertColor,
  });

  @override
  AppSemanticColors copyWith({
    Color? headingColor,
    Color? paragraphColor,
    Color? labelColor,
    Color? contentBackgroundColor,
    Color? alertColor,
  }) {
    return AppSemanticColors(
      headingColor: headingColor ?? this.headingColor,
      paragraphColor: paragraphColor ?? this.paragraphColor,
      labelColor: labelColor ?? this.labelColor,
      contentBackgroundColor:
          contentBackgroundColor ?? this.contentBackgroundColor,
      alertColor: alertColor ?? this.alertColor,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) {
      return this;
    }
    return AppSemanticColors(
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
