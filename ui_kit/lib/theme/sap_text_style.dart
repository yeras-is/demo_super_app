import 'package:flutter/material.dart';
import 'package:ui_kit/theme/sap_colors.dart';

extension SapTextStylesExtension on BuildContext {
  TextStyle get h1 => SapTextStyles.h1;

  TextStyle get h2 => SapTextStyles.h2;

  TextStyle get h2Bold => SapTextStyles.h2Bold;

  TextStyle get h3 => SapTextStyles.h3;

  TextStyle get h3Regular => SapTextStyles.h3Regular;

  TextStyle get h3Bold => SapTextStyles.h3Bold;

  TextStyle get bodyPrimary => SapTextStyles.bodyPrimary;

  TextStyle get bodyPrimarySemibold => SapTextStyles.bodyPrimarySemibold;

  TextStyle get bodySecondary => SapTextStyles.bodySecondary;

  TextStyle get subtitleSemibold => SapTextStyles.subtitleSemibold;

  TextStyle get button => SapTextStyles.button;

  TextStyle get captionPrimary => SapTextStyles.captionPrimary;

  TextStyle get captionAdditional => SapTextStyles.captionAdditional;

  TextStyle get captionBold => SapTextStyles.captionBold;

  TextStyle get captionSecondary => SapTextStyles.captionSecondary;

  TextStyle get caption2 => SapTextStyles.caption2;

  TextStyle get header2 => SapTextStyles.header2;

  TextStyle get error => SapTextStyles.error;

  TextStyle get errorSmall => SapTextStyles.errorSmall;
}

class SapTextStyles {
  static const h1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 32 / 26,
    letterSpacing: -0.3,
    color: MColors.textMain,
  );

  static const h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 27 / 22,
    color: MColors.textMain,
    letterSpacing: -0.5,
  );

  static const h2Bold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 27 / 22,
    color: MColors.textMain,
    letterSpacing: -0.5,
  );

  static const h3 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 22 / 17,
    color: MColors.textMain,
    letterSpacing: -0.3,
  );

  static const h3Regular = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 22 / 17,
    color: MColors.textMain,
    letterSpacing: -0.3,
  );

  static const h3Bold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    height: 22 / 17,
    color: MColors.textMain,
    letterSpacing: 0,
  );

  static const bodyPrimary = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 20 / 15,
    color: MColors.textMain,
  );

  static const bodyPrimarySemibold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 20 / 15,
    color: MColors.textMain,
  );

  static const bodySecondary = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.23,
    color: MColors.textMain,
  );

  static const subtitleSemibold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 16 / 13,
    color: MColors.textMain,
  );

  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 20 / 15,
    color: MColors.textMain,
  );

  static const captionPrimary = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 16 / 11,
    color: MColors.textMain,
  );

  static const captionAdditional = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 16 / 11,
    color: MColors.white,
  );

  static const captionBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 20 / 11,
    color: MColors.white,
  );

  static const captionSecondary = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 20 / 11,
    color: MColors.textSecondary,
  );

  static const caption2 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 14 / 11,
    color: MColors.textSecondary,
  );

  static const header2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 23.46 / 20,
    color: MColors.textSecondary,
  );

  static const error = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
    color: MColors.textActiveMistake,
  );

  static const errorSmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 16 / 13,
    color: MColors.textActiveMistake,
  );
}
