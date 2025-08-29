// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:swappid/core/helper/assets.gen.dart';
import 'package:swappid/core/navigator/navigator.dart';
import 'package:swappid/core/storage/dispatch.dart';
import 'package:swappid/core/theme/theme.dart';
import 'package:swappid/features/swappid/app/views/pages/dashboard.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/onboard.main.dart';
import 'package:swappid/features/onboarding/app/views/pages/welcome.dart';

class SplashController {
  final PageController pageController = PageController();

  void initSplash() {
    BuildContext context = KNavigator.context;
    Future.delayed(const Duration(seconds: 2), () {
      KNavigator.pushNamed(context, _getRoute);
    });
  }

  bool get isAuthenticated => getUser != null;
  bool get isFirstTimeUse => isFirstTime();

  // Get Route to navigate
  String get _getRoute => isAuthenticated
      ? Dashboard.route
      : isFirstTimeUse
          ? OnboardMain.route
          : Welcome.route;

  // Get Splash Logo
  String get splashLogo => (KTheme.isDark()
          ? Assets.images.imgWhiteOnBlack
          : Assets.images.imgBlackOnWhite)
      .path;
}
