import 'package:flutter/material.dart';

class Palette {
  static const primary = Color(0xFFFF5859);
  static const secondary = Color(0xFF020D19);

  static const green = Color(0xFF17C151);
  static const greenFaded = Color(0xFF6FD2A3);
  static const orange = Color(0xFFEDA145);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Colors.transparent;
  static const gray = Color(0xFF898989);
  static const grayFaded = Color(0xFFFAFAFA);
  static const ooprimary = Color(0xFF2E2E2E);
  static const scaffoldBackground = Color(0xFF1E1E1E);

  static const red = Color(0xFFB00020);
  static const redFaded = Color(0xFFFCD8DF);


  static  getOoWhite(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? ooprimary : white;
  static  getOoWhite2(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? white : ooprimary;
  static  getOoprimary(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? ooprimary : primary;
}

/// Light [ColorScheme] made with FlexColorScheme v8.0.2.
/// Requires Flutter 3.22.0 or later.
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF1D2228),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB0B2C0),
  onPrimaryContainer: Color(0xFF000000),
  primaryFixed: Color(0xFFCCCFD2),
  primaryFixedDim: Color(0xFFA4A7AE),
  onPrimaryFixed: Color(0xFF000000),
  onPrimaryFixedVariant: Color(0xFF000000),
  secondary: Color(0xFFFB8122),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFFFB680),
  onSecondaryContainer: Color(0xFF000000),
  secondaryFixed: Color(0xFFF1C29E),
  secondaryFixedDim: Color(0xFFEBA46E),
  onSecondaryFixed: Color(0xFF000000),
  onSecondaryFixedVariant: Color(0xFF1A0B00),
  tertiary: Color(0xFFEA9654),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFFE9CBAB),
  onTertiaryContainer: Color(0xFF000000),
  tertiaryFixed: Color(0xFFEBCDB5),
  tertiaryFixedDim: Color(0xFFE0B28E),
  onTertiaryFixed: Color(0xFF080400),
  onTertiaryFixedVariant: Color(0xFF321A06),
  error: Color(0xFFB00020),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFCD8DF),
  onErrorContainer: Color(0xFF000000),
  surface: Color(0xFFFCFCFC),
  onSurface: Color(0xFF111111),
  surfaceDim: Color(0xFFE0E0E0),
  surfaceBright: Color(0xFFFDFDFD),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF8F8F8),
  surfaceContainer: Color(0xFFF3F3F3),
  surfaceContainerHigh: Color(0xFFEDEDED),
  surfaceContainerHighest: Color(0xFFE7E7E7),
  onSurfaceVariant: Color(0xFF393939),
  outline: Color(0xFF919191),
  outlineVariant: Color(0xFFD1D1D1),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF2A2A2A),
  onInverseSurface: Color(0xFFF1F1F1),
  inversePrimary: Color(0xFF9EA2A6),
  surfaceTint: Color(0xFF1D2228),
);

/// Dark [ColorScheme] made with FlexColorScheme v8.0.2.
/// Requires Flutter 3.22.0 or later.
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF777A7E),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF313C42),
  onPrimaryContainer: Color(0xFFFFFFFF),
  primaryFixed: Color(0xFFCCCFD2),
  primaryFixedDim: Color(0xFFA4A7AE),
  onPrimaryFixed: Color(0xFF000000),
  onPrimaryFixedVariant: Color(0xFF000000),
  secondary: Color(0xFFFCB075),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFD97B18),
  onSecondaryContainer: Color(0xFFFFFFFF),
  secondaryFixed: Color(0xFFF1C29E),
  secondaryFixedDim: Color(0xFFEBA46E),
  onSecondaryFixed: Color(0xFF000000),
  onSecondaryFixedVariant: Color(0xFF1A0B00),
  tertiary: Color(0xFFEFB383),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFFA75F27),
  onTertiaryContainer: Color(0xFFFFFFFF),
  tertiaryFixed: Color(0xFFEBCDB5),
  tertiaryFixedDim: Color(0xFFE0B28E),
  onTertiaryFixed: Color(0xFF080400),
  onTertiaryFixedVariant: Color(0xFF321A06),
  error: Color(0xFFCF6679),
  onError: Color(0xFF000000),
  errorContainer: Color(0xFFB1384E),
  onErrorContainer: Color(0xFFFFFFFF),
  surface: Color(0xFF1E1E1E),
  onSurface: Color(0xFFF1F1F1),
  surfaceDim: Color(0xFF060606),
  surfaceBright: Color(0xFF2C2C2C),
  surfaceContainerLowest: Color(0xFF1E1E1E),
  surfaceContainerLow: Color(0xFF1E1E1E),
  surfaceContainer: Color(0xFF1E1E1E),
  surfaceContainerHigh: Color(0xFF1E1E1E),
  surfaceContainerHighest: Color(0xFF282828),
  onSurfaceVariant: Color(0xFFCACACA),
  outline: Color(0xFF777777),
  outlineVariant: Color(0xFF414141),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFE8E8E8),
  onInverseSurface: Color(0xFF2A2A2A),
  inversePrimary: Color(0xFF393A3C),
  surfaceTint: Color(0xFF777A7E),
);
