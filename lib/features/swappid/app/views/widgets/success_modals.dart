import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessModals {
  static void showSuccessModal(
    BuildContext context, {
    required String title,
    required String message,
    required List<SuccessModalButton> buttons,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),

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
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),

            // Message
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            // Buttons
            ...buttons
                .map((button) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: button.onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: button.isPrimary
                                ? Color(0xFF5C1EDC)
                                : Colors.white,
                            foregroundColor: button.isPrimary
                                ? Colors.white
                                : Color(0xFF5C1EDC),
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: button.isPrimary
                                  ? BorderSide.none
                                  : BorderSide(color: Color(0xFF5C1EDC)),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            button.text,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),

            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  static void showKYCSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),

            // Success icon
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: Color(0xFF17C151).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                size: 48.sp,
                color: Color(0xFF17C151),
              ),
            ),
            SizedBox(height: 16.h),

            // Title with KYC highlight
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Transaction Successful! ",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "(KYC Required)",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFEDA145),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            // Message
            Text(
              "Your transaction has been processed, but your crypto wallet will be credited once you complete your KYC verification.",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to KYC screen
                  Navigator.of(context).pop(); // Close modal
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Navigating to KYC...')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C1EDC),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Complete KYC Now",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close modal
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/dashboard', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF5C1EDC),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Color(0xFF5C1EDC)),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement share receipt functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Receipt shared!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF5C1EDC),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Color(0xFF5C1EDC)),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Share Receipt",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

class SuccessModalButton {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  SuccessModalButton({
    required this.text,
    required this.isPrimary,
    required this.onPressed,
  });
}
