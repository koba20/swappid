import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/verify_identity.dart';

class EmailVerifiedSuccessPage extends StatelessWidget {
  static const route = '/email-verified-success';
  const EmailVerifiedSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE7F9EF),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(32),
                  child: Icon(Icons.check_circle,
                      color: Color(0xFF17C151), size: 64),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Email Verified',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Your email has been successfully verified.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                SizedBox(height: 40.h),
                SButton(
                  text: 'Continue',
                  backgroundColor: Color(0xFF5C1EDC), // or your brand purple
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  height: 70.h,
                  width: double.infinity,
                  radius: 30, // or leave out for auto-pill
                  onPressed: () {
                    Navigator.pushNamed(context, VerifyIdentityPage.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
