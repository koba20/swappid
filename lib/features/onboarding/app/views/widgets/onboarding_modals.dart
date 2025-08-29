import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';

class OnboardingModals {
  // Email Verification Loading Modal
  static void showEmailVerifyingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Title
            Text(
              "Verifying Your Email...",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),

            // Loading bar
            LinearProgressIndicator(
              backgroundColor: Color(0xFFD1C3F7),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
            ),
            SizedBox(height: 16.h),

            // Message
            Text(
              "Please wait while we verify your email address. This shouldn't take long.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Email Verified Success Modal
  static void showEmailVerifiedModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Success image
            Container(
              width: 80.w,
              height: 80.w,
              child: Image.asset(
                'assets/images/success_svg.png',
                width: 80.w,
                height: 80.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.h),

            // Title
            Text(
              "Email Verified",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),

            // Message
            Text(
              "Your email address has been successfully verified.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 24.h),

            // Continue button
            SButton(
              text: "Continue",
              onPressed: () {
                Navigator.of(context).pop(); // Close modal
                Navigator.pushNamed(context, '/verify-identity');
              },
              backgroundColor: Color(0xFF5C1EDC), // or your brand purple
              textColor: Colors.white,
              fontSize: 16.sp,
              height: 70.h,
              width: double.infinity,
              radius: 30, // or leave out for auto-pill
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Phone Number Verification Loading Modal
  static void showPhoneVerifyingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Title
            Text(
              "Verifying Your phone number...",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),

            // Loading bar
            LinearProgressIndicator(
              backgroundColor: Color(0xFFD1C3F7),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
            ),
            SizedBox(height: 16.h),

            // Message
            Text(
              "Please wait while we verify your phone number. This shouldn't take long.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Phone Number Verified Success Modal
  static void showPhoneVerifiedModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Success image
            Container(
              width: 80.w,
              height: 80.w,
              child: Image.asset(
                'assets/images/success_svg.png',
                width: 80.w,
                height: 80.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.h),

            // Title
            Text(
              "Phone number Verified",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),

            // Message
            Text(
              "Your phone number has been successfully verified.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 24.h),

            // Continue button
            SButton(
              text: "Continue",
              onPressed: () {
                Navigator.of(context).pop(); // Close modal
                Navigator.pushNamed(context, '/kyc-selection');
              },
              backgroundColor: Color(0xFF5C1EDC), // or your brand purple
              textColor: Colors.white,
              fontSize: 16.sp,
              height: 70.h,
              width: double.infinity,
              radius: 30, // or leave out for auto-pill
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // BVN Verification Loading Modal
  static void showBVNVerifyingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Title
            Text(
              "Verifying Bank Verification Number...",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),

            // Loading bar
            LinearProgressIndicator(
              backgroundColor: Color(0xFFD1C3F7),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
            ),
            SizedBox(height: 16.h),

            // Message
            Text(
              "Please wait while we verify your Bank Verification Number. This shouldn't take long.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // BVN Verified Success Modal
  static void showBVNVerifiedModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Success image
            Container(
              width: 80.w,
              height: 80.w,
              child: Image.asset(
                'assets/images/success_svg.png',
                width: 80.w,
                height: 80.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.h),

            // Title
            Text(
              "Bank Verification Number Verified",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),

            // Message
            Text(
              "Your Bank Verification Number (BVN) has been successfully verified.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 24.h),

            // Continue button
            SButton(
              text: "Continue",
              onPressed: () {
                Navigator.of(context).pop(); // Close modal
                Navigator.pushNamed(context, '/preparing-dashboard');
              },
              backgroundColor: Color(0xFF5C1EDC), // or your brand purple
              textColor: Colors.white,
              fontSize: 16.sp,
              height: 70.h,
              width: double.infinity,
              radius: 30, // or leave out for auto-pill
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
