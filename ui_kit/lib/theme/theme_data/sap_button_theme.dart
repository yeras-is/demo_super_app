import 'package:flutter/material.dart';

const _buttonTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);
const _buttonFixedSize = Size.fromHeight(44);
const _buttonPadding = EdgeInsets.symmetric(horizontal: 16);
final _buttonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));

final elevatedButtonStyle = ElevatedButton.styleFrom(
  fixedSize: _buttonFixedSize,
  padding: _buttonPadding,
  textStyle: _buttonTextStyle,
  shape: _buttonShape,
);

final outlinedButtonStyle = OutlinedButton.styleFrom(
  textStyle: _buttonTextStyle,
  fixedSize: _buttonFixedSize,
  padding: _buttonPadding,
  shape: _buttonShape,
  side: const BorderSide(width: 1.5),
);

final textButtonStyle = TextButton.styleFrom(
  textStyle: _buttonTextStyle,
  fixedSize: _buttonFixedSize,
  padding: _buttonPadding,
  shape: _buttonShape,
);
