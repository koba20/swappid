import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swappid/app.dart';

/// The [AppTheme] defines light and dark themes for the app.
/// Use in [MaterialApp] like this:
/// sealed class

class AppTheme {
  BuildContext context;
  AppTheme(this.context);

  ThemeData getDark() {
    ThemeData dark = FlexThemeData.dark(
      scheme: FlexScheme.shark,
      fontFamily: 'Outfit',
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        blendOnColors: true,
        useM2StyleDividerInM3: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      useMaterial3: false,
    );

    return dark;
  }

  ThemeData getLight() {
    ThemeData light = FlexThemeData.light(
      scheme: FlexScheme.shark,
      fontFamily: 'Outfit',
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        inputDecoratorIsFilled: true,
        useM2StyleDividerInM3: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      useMaterial3: false,
    );

    return light;
  }
}

class KTheme {
  static ThemeData getDark() {
    return FlexThemeData.dark(
        // scheme: FlexScheme.shark,
        );
  }

  static ThemeData getLight() {
    return FlexThemeData.light(
      scheme: FlexScheme.shark,
    );
  }

  static ColorScheme ofColorScheme() {
    BuildContext context = SwappidApp.navKey.currentContext!;
    return Theme.of(context).colorScheme;
  }

  static TextTheme ofTextStyle() {
    BuildContext context = SwappidApp.navKey.currentContext!;
    return Theme.of(context).textTheme;
  }

  static bool isDark() {
    BuildContext context = SwappidApp.navKey.currentContext!;
    return Theme.of(context).brightness == Brightness.dark;
  }
}
