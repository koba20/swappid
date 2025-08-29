import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/extensions/number.extension.dart';
import 'package:swappid/core/theme/theme.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'package:swappid/core/widgets/buttons/app_button_back.dart';
import 'package:swappid/features/onboarding/app/views/widgets/bars.progress.dart';
import 'package:swappid/features/onboarding/data/constants/constants.dart';
import 'package:swappid/features/onboarding/data/models/onboard.items.model.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/sign_up.dart';
import 'package:swappid/features/authentication/app/views/pages/login.dart';

class OnboardMain extends StatefulWidget {
  const OnboardMain({super.key});

  static const String route = '/onboard-main';

  @override
  State<OnboardMain> createState() => _OnboardMainState();
}

class _OnboardMainState extends State<OnboardMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _content());
  }

  Widget _buildOnboardingItem(OnboardItemsModel p0) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(item.image),
          Text(
            p0.title,
            //textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: KTheme.getLight().colorScheme.primary),
          ),
          20.height,
          Text(
            p0.description,
            //textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: KTheme.getLight().colorScheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            //const Expanded(child: Column()),
            20.height,
            StoryProgressBar(
              length: OnboardingConstants.onboardingItems.length,
              activeColor: Color(0xFF5C1EDC),
              duration: const Duration(seconds: 3),
              repeat: true,
              height: 5.h,
              onIndexChanged: (index) {},
            ),
            10.height,
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                itemCount: OnboardingConstants.onboardingItems.length,
                itemBuilder: (context, index) => _buildOnboardingItem(
                    OnboardingConstants.onboardingItems[index]),
              ),
            ),
            Expanded(child: SizedBox()),
            SButton(
              text: 'Create Account',
              backgroundColor: Color(0xFF5C1EDC), // or your brand purple
              textColor: Colors.white,
              fontSize: 16.sp,
              height: 70.h,
              width: double.infinity,
              radius: 30, // or leave out for auto-pill
              onPressed: () {
                Navigator.pushNamed(context, SignUpPage.route);
              },
            ),

            SButton(
              text: 'Log In',
              gradient: LinearGradient(
                colors: [
                  Color(0xFFD1C3F7),
                  Color(0xFFBFC8E9)
                ], // adjust to your desired gradient
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              textColor: Color(0xFF5C1EDC), // purple text
              fontSize: 16.sp,
              height: 45.h,
              width: double.infinity,
              radius: 30, // or leave out for auto-pill
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.route);
              },
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
