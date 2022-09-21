import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

ThemeData get superAppTheme => ThemeData(
      useMaterial3: true,
      // 1) amber red green
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      // 3) 5 -> 3 -> 10
      dividerTheme: const DividerThemeData(thickness: 3),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        scrolledUnderElevation: 50,
        // 2) true false true
        centerTitle: true,
        color: Colors.white,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
