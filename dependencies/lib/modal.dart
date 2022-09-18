import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void callModalBottomSheet(BuildContext context, Widget child) => showCupertinoModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      useRootNavigator: true,
      expand: true,
      builder: (_) => Material(child: child),
    );
