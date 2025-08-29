import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/features/onboarding/app/controllers/splash.controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String route = '/splash';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.initSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _content());
  }

  Widget _content() {
    return Container();
    // Center(
    //   child: Image.asset(
    //     controller.splashLogo,
    //     width: 150.h,
    //     height: 150.h,
    //   ),
    // );
  }
}
