import 'package:flutter/material.dart';

extension SapThemeExtension on BuildContext {
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIos => Theme.of(this).platform == TargetPlatform.iOS;
}
