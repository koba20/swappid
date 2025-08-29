import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'onboarding_rutine/sign_up.dart';
import '../../../../authentication/app/views/pages/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  static const route = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with time and status
            _buildHeader(),

            // Main content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Main title
                    Text(
                      "BUY CRYPTO WITH CASH EFFORTLESSLY",
                      style: GoogleFonts.outfit(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  // Create Account button
                  SButton(
                    text: "Create account",
                    onPressed: () =>
                        Navigator.pushNamed(context, SignUpPage.route),
                    backgroundColor: Color(0xFF5C1EDC), // or your brand purple
                    textColor: Colors.white,
                    fontSize: 16.sp,
                    height: 70.h,
                    width: double.infinity,
                    radius: 30, // or leave out for auto-pill
                  ),
                  SizedBox(height: 16.h),

                  // Login button
                  SButton(
                    text: "Login",
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginPage.route),
                    backgroundColor: Colors.white,
                    textColor: Color(0xFF5C1EDC),
                    fontSize: 16.sp,
                    height: 70.h,
                    width: double.infinity,
                    radius: 30, // or leave out for auto-pill
                    borderColor: Color(0xFF5C1EDC),
                    borderWidth: 1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "10:50",
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(Icons.wifi, size: 16.sp, color: Colors.black),
              SizedBox(width: 4.w),
              Icon(Icons.battery_full, size: 16.sp, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
