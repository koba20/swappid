import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'package:pinput/pinput.dart';
import '../../widgets/onboarding_modals.dart';

class VerifyNumberPage extends StatefulWidget {
  static const route = '/verify-number';
  const VerifyNumberPage({Key? key}) : super(key: key);

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final TextEditingController _otpController = TextEditingController();
  int _expirySeconds = 59;
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _isTimerRunning = false;
    _otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isTimerRunning && mounted) {
        setState(() {
          if (_expirySeconds > 0) {
            _expirySeconds--;
            _startTimer();
          }
        });
      }
    });
  }

  bool get _canVerify {
    return _otpController.text.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),

                    Text(
                      "Verify your number",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "A verification code has been sent to +234 901 234 5678. Enter the code below to continue.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.7),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // OTP input fields
                    _buildOTPInput(),
                    SizedBox(height: 16.h),

                    // Timer
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 14.sp,
                          color: Color(0xFFEDA145),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Resend code in 00:${_expirySeconds.toString().padLeft(2, '0')}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFEDA145),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),

                    // Verify button
                    _buildVerifyButton(),
                    SizedBox(height: 24.h),
                  ],
                ),
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
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 16.sp, color: Colors.black),
                Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Verify your number",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 60.w), // Balance the header
        ],
      ),
    );
  }

  Widget _buildOTPInput() {
    return Pinput(
      length: 6,
      controller: _otpController,
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF5C1EDC), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF5C1EDC), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      errorPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onCompleted: (pin) {
        _otpController.text = pin;
        setState(() {});
      },
      onChanged: (pin) {
        _otpController.text = pin;
        setState(() {});
      },
    );
  }

  Widget _buildVerifyButton() {
    return SButton(
      text: "Verify Number",
      onPressed: _canVerify ? _onVerifyPressed : null,
      backgroundColor: _canVerify
          ? Color(0xFF5C1EDC) // or your brand purple
          : Color(0xFF5C1EDC).withOpacity(0.3),
      textColor: Colors.white,
      fontSize: 16.sp,
      height: 70.h,
      width: double.infinity,
      radius: 30, // or leave out for auto-pill
    );
  }

  void _onVerifyPressed() {
    // Show loading modal
    OnboardingModals.showPhoneVerifyingModal(context);

    // Simulate verification process
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close loading modal
      OnboardingModals.showPhoneVerifiedModal(context);
    });
  }
}
