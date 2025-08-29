import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'bank_transfer_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  static const route = "/buy-crypto/payment-method";

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedPaymentMethod;
  bool _saveAsDefault = false;

  bool get _canContinue {
    return _selectedPaymentMethod != null;
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

                    // Payment options
                    _buildPaymentOptions(),
                    SizedBox(height: 24.h),

                    // Save as default checkbox
                    if (_selectedPaymentMethod != null) _buildSaveAsDefault(),
                    SizedBox(height: 32.h),

                    // Continue button
                    _buildContinueButton(),
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
                "Choose Payment Method",
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

  Widget _buildPaymentOptions() {
    final paymentMethods = [
      {
        "id": "bank_transfer",
        "title": "Pay with Bank Transfer",
        "description": "Pay with your local bank account",
        "icon": Icons.account_balance,
      },
      // {
      //   "id": "debit_card",
      //   "title": "Pay with Debit Card",
      //   "description": "Secure payment with your debit card",
      //   "icon": Icons.credit_card,
      // },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Payment Method",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        ...paymentMethods.map((method) => _buildPaymentOption(method)),
      ],
    );
  }

  Widget _buildPaymentOption(Map<String, dynamic> method) {
    final isSelected = _selectedPaymentMethod == method["id"];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method["id"];
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color:
              isSelected ? Color(0xFF5C1EDC).withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? Color(0xFF5C1EDC).withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                method["icon"] as IconData,
                size: 24.sp,
                color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[600],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method["title"] as String,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    method["description"] as String,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 12.sp,
                      color: Color(0xFF5C1EDC),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveAsDefault() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _saveAsDefault = !_saveAsDefault;
            });
          },
          child: Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              color: _saveAsDefault ? Color(0xFF5C1EDC) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: _saveAsDefault ? Color(0xFF5C1EDC) : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: _saveAsDefault
                ? Icon(
                    Icons.check,
                    size: 12.sp,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          "Save as default payment method?",
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SButton(
      text: "Continue",
      onPressed: _canContinue ? _onContinuePressed : null,
      backgroundColor:
          _canContinue ? Color(0xFF5C1EDC) : Color(0xFF5C1EDC).withOpacity(0.3),
      textColor: Colors.white,
      fontSize: 16.sp,
      height: 70.h,
      width: double.infinity,
      radius: 30,
    );
  }

  void _onContinuePressed() {
    if (_selectedPaymentMethod == "bank_transfer") {
      Navigator.of(context, rootNavigator: true)
          .pushNamed(BankTransferScreen.route);
    } else {
      // TODO: Navigate to debit card payment screen
      Navigator.of(context, rootNavigator: true)
          .pushNamed(BankTransferScreen.route);
    }
  }
}
