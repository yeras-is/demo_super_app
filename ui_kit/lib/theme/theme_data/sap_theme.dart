import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

ThemeData get superAppTheme => ThemeData(
      useMaterial3: true,
      // 1) amber red green
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      dialogTheme: sapDialogTheme,
      // 3) 5 -> 3 -> 10
      dividerTheme: const DividerThemeData(thickness: 3),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyle),
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        scrolledUnderElevation: 50,
        // 2) true false true
        centerTitle: true,
        color: Colors.white,
      ),
      switchTheme: sapSwitchTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      radioTheme: sapRadioTheme,
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
