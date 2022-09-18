import 'dart:math';

import 'package:flutter/material.dart';

abstract class MColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;

  //Primary
  static const Color primary = Color(0xFFA42252);
  static const Color primarySecondary = Color(0xFFC0194F);
  static const Color primarySecondary03 = Color(0x08C0194F);

  //Text
  static const Color textMain = Color(0xFF18283B);
  static const Color textSecondary = Color(0xFF99A2AD);
  static const Color textTabBar = Color(0xFF99A2AD);
  static const Color textActiveMistake = Color(0xFFC0194F);

  //Gray
  static const Color grayDark = Color(0xFF5D6875);
  static const Color grayTabBar = Color(0xFF99A2AD);
  static const Color grayStroke = Color(0xFFF1F2F3);
  static const Color graySearch = Color(0xFFF1F2F3);
  static const Color grayLight = Color(0xFFF9FAFA);
  static const Color grayMedium = Color(0xFFCCD0D6);
  static const Color grayMessenger = Color(0xFFFAFAFA);
  static const Color darkGray = Color(0xFFC4C4C4);

  //Additional
  static const Color additionalSecondary = Color(0xFFE93B90);
  static const Color additionalBlue = Color(0xFF3F8AE0);
  static const Color additionalGray = Color(0xFFB8C1CC);
  static const Color skeletonGradientBegin = Color(0xFFF9F9F9);
  static const Color skeletonGradientEnd = Color(0xFFE9E9E9);
  static const Color additionalGreenDark = Color(0xFF088F94);
  static const Color additionalGreenMedium = Color(0xFF589F28);
  static const Color additionalBlueDark = Color(0xFF286C82);
  static const Color additionalLightGray = Color(0xFFD4D1C5);
  static const Color additionalBarrierBlack = Color(0x59000000);

  //Gradients
  static const LinearGradient gradientBanner1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE6F5FE),
      Color(0xFFE6EAFC),
    ],
  );
  static const LinearGradient gradientBanner2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD7DFF6),
      Color(0xFFFDDFF8),
    ],
  );
  static const LinearGradient gradientBanner3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD3E9E1),
      Color(0xFFE6F5FE),
    ],
  );
  static const LinearGradient gradientBanner4 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD3E9E1),
      Color(0xFFECFBD9),
    ],
  );
  static const LinearGradient gradientBanner5 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF4E4D2),
      Color(0xFFFFF9DC),
    ],
  );
  static const LinearGradient gradientBanner6 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFDDFF8),
      Color(0xFFD3E9E1),
    ],
  );

  static const LinearGradient gradientBanner7 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFC6EFFD),
      Color(0xFFCFD1FA),
    ],
  );

  static const LinearGradient gradientBanner8 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFECFBD9),
      Color(0xFFFFF9DC),
    ],
  );

  static const LinearGradient gradientBanner9 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE6EAFC),
      Color(0xFFECFBD9),
    ],
  );

  static const LinearGradient gradientButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFC0194F),
      Color(0xFF852C49),
    ],
  );

  static const LinearGradient gradientDarkBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E698F),
      Color(0xFF2D4A6C),
    ],
  );

  static const LinearGradient gradientMaroonBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF852C49),
      Color(0xFF2D4A6C),
    ],
  );
  static const LinearGradient gradientStar = LinearGradient(
    stops: [0.5, 1.0],
    colors: [
      Color(0xFF18283B),
      Color(0xFF99A2AD),
    ],
  );

  static const LinearGradient gradientFlag = LinearGradient(
    colors: [
      Color(0xFFDAF3F6),
      Color(0xFFECF4E9),
    ],
  );

  static const skeletonGradient = LinearGradient(
    colors: [skeletonGradientBegin, skeletonGradientEnd],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static Color hexFromString(String input) {
    var hexColor = input.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    return Color(
      int.parse('0x$hexColor'),
    );
  }

  static LinearGradient getRandomGradient() {
    final random = Random().nextInt(10);
    switch (random) {
      case 1:
        return gradientBanner1;
      case 2:
        return gradientBanner2;
      case 3:
        return gradientBanner3;
      case 4:
        return gradientBanner4;
      case 5:
        return gradientBanner5;
      case 6:
        return gradientBanner6;
      case 7:
        return gradientBanner7;
      case 8:
        return gradientBanner8;
      default:
        return gradientBanner9;
    }
  }
}

/*
В конструкторе Color первые два символа означают opacity, ниже приведены hex для всех возможных значений.

100% — FF
99% — FC
98% — FA
97% — F7
96% — F5
95% — F2
94% — F0
93% — ED
92% — EB
91% — E8
90% — E6
89% — E3
88% — E0
87% — DE
86% — DB
85% — D9
84% — D6
83% — D4
82% — D1
81% — CF
80% — CC
79% — C9
78% — C7
77% — C4
76% — C2
75% — BF
74% — BD
73% — BA
72% — B8
71% — B5
70% — B3
69% — B0
68% — AD
67% — AB
66% — A8
65% — A6
64% — A3
63% — A1
62% — 9E
61% — 9C
60% — 99
59% — 96
58% — 94
57% — 91
56% — 8F
55% — 8C
54% — 8A
53% — 87
52% — 85
51% — 82
50% — 80
49% — 7D
48% — 7A
47% — 78
46% — 75
45% — 73
44% — 70
43% — 6E
42% — 6B
41% — 69
40% — 66
39% — 63
38% — 61
37% — 5E
36% — 5C
35% — 59
34% — 57
33% — 54
32% — 52
31% — 4F
30% — 4D
29% — 4A
28% — 47
27% — 45
26% — 42
25% — 40
24% — 3D
23% — 3B
22% — 38
21% — 36
20% — 33
19% — 30
18% — 2E
17% — 2B
16% — 29
15% — 26
14% — 24
13% — 21
12% — 1F
11% — 1C
10% — 1A
9% — 17
8% — 14
7% — 12
6% — 0F
5% — 0D
4% — 0A
3% — 08
2% — 05
1% — 03
0% — 00
*/
