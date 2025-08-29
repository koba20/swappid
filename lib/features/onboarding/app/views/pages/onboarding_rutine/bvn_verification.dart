import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import '../../widgets/onboarding_modals.dart';

class BVNVerificationPage extends StatefulWidget {
  static const route = '/bvn-verification';
  const BVNVerificationPage({Key? key}) : super(key: key);

  @override
  State<BVNVerificationPage> createState() => _BVNVerificationPageState();
}

class _BVNVerificationPageState extends State<BVNVerificationPage> {
  final TextEditingController _bvnController = TextEditingController();
  bool _cantVerify = false;

  bool get _canVerify {
    return _bvnController.text.length == 11;
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
                      "Bank Verification Number",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Provide your 11-digit Bank Verification Number (BVN) to link your account.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.7),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // BVN input field
                    Text(
                      "BVN",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _bvnController,
                      keyboardType: TextInputType.number,
                      maxLength: 11,
                      style: TextStyle(fontSize: 15.sp),
                      decoration: InputDecoration(
                        hintText: 'e.g. 22345678901',
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Color(0xFF5C1EDC), width: 1.5),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 16.h),

                    // Can't verify checkbox
                    Row(
                      children: [
                        Text(
                          "To get your BVN, dial *565*0#",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
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

            // Numeric keypad
            // _buildNumericKeypad(), // Removed custom keypad
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
                "Bank Verification Number",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Skip for later
            },
            child: Text(
              "Skip for later",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF5C1EDC),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifyButton() {
    return SButton(
      text: "Verify My Account",
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

  // Removed _buildNumericKeypad()

  void _onVerifyPressed() {
    // Show loading modal
    OnboardingModals.showBVNVerifyingModal(context);

    // Simulate verification process
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close loading modal
      OnboardingModals.showBVNVerifiedModal(context);
    });
  }
}
