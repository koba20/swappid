import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/navigator/router.dart';
import 'package:swappid/core/theme/theme.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/onboard.main.dart';
import 'package:swappid/features/onboarding/app/views/pages/spalsh.dart';
import 'package:swappid/features/onboarding/app/views/pages/welcome.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/sign_up.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_email.dart';
import 'package:swappid/features/authentication/app/views/pages/login.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/email_verified_success.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_identity.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_number.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/number_verified_success.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/bank_verification.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/processing.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/kyc_selection.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/bvn_verification.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/preparing_dashboard.dart';
import 'package:swappid/features/swappid/app/views/pages/dashboard.dart';
import 'package:swappid/features/swappid/app/views/pages/main_navigation.dart';
import 'package:swappid/features/swappid/app/views/pages/transactions_page.dart';
import 'package:swappid/features/swappid/app/views/pages/transaction_details.dart';
import 'package:swappid/features/swappid/app/views/pages/demo_page.dart';
import 'package:swappid/features/swappid/app/views/pages/buy_crypto_flow/amount_input_screen.dart';
import 'package:swappid/features/swappid/app/views/pages/buy_crypto_flow/wallet_address_screen.dart';
import 'package:swappid/features/swappid/app/views/pages/buy_crypto_flow/payment_method_screen.dart';
import 'package:swappid/features/swappid/app/views/pages/buy_crypto_flow/bank_transfer_screen.dart';
import 'package:swappid/features/onboarding/app/views/pages/welcome.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/sign_up.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_email.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_identity.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_number.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/kyc_selection.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/bvn_verification.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/preparing_dashboard.dart';

part 'routes.dart';

class SwappidApp extends StatefulWidget {
  const SwappidApp({super.key});

  static final navKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  State<SwappidApp> createState() => _SwappidAppState();
}

class _SwappidAppState extends State<SwappidApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is going to background, show dialog
    }
  }

  MediaQueryData mediaQuery(height) {
    return MediaQuery.of(context).copyWith(
      textScaleFactor: height <= 620
          ? 0.8
          : height <= 820
              ? 0.9
              : 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    // Responsive design
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(430, 979),
      builder: (context, child) {
        // Create the app
        return MaterialApp(
          navigatorKey: SwappidApp.navKey,
          scaffoldMessengerKey: SwappidApp.scaffoldMessengerKey,
          initialRoute: Splash.route,
          darkTheme: KTheme.getDark(),
          theme: KTheme.getLight(),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            final height = MediaQuery.of(context).size.height;
            return MediaQuery(
              data: mediaQuery(height),
              child: Overlay(
                initialEntries: [
                  OverlayEntry(builder: (context) => child ?? const Material()),
                ],
              ),
            );
          },
          onGenerateRoute: onGenerate,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
