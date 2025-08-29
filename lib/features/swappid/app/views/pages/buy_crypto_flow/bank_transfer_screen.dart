import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import '../../widgets/success_modals.dart';

class BankTransferScreen extends StatefulWidget {
  static const route = "/buy-crypto/bank-transfer";

  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  final String _bankName = "Wema Bank";
  final String _accountNumber = "3001202206";
  final String _accountName = "Swappid Technologies";
  final String _amount = "₦120,000.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
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

                    // Instructions banner
                    _buildInstructionsBanner(),
                    SizedBox(height: 24.h),

                    // Bank details
                    _buildBankDetails(),
                    SizedBox(height: 32.h),

                    // Transfer button
                    _buildTransferButton(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // Footer
            _buildFooter(),
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
                "Pay with Bank Transfer",
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

  Widget _buildInstructionsBanner() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFEDA145).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFEDA145).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 20.sp,
                color: Color(0xFFEDA145),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kindly transfer the exact amount to the bank account below.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFEDA145),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Please transfer with an account that has the exact name 'John Doe'. Transfers from unknown bank accounts will be rejected.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFEDA145),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBankDetails() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bank Details",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          _buildDetailRow("Bank Name", _bankName),
          _buildDetailRow("Account Number", _accountNumber, canCopy: true),
          _buildDetailRow("Account Name", _accountName, canCopy: true),
          _buildDetailRow("Amount to pay", _amount, canCopy: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool canCopy = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              if (canCopy) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    // TODO: Copy to clipboard
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$label copied to clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.copy,
                    size: 16.sp,
                    color: Color(0xFF5C1EDC),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransferButton() {
    return SButton(
      text: "I've made the transfer",
      onPressed: _onTransferPressed,
      backgroundColor: Color(0xFF5C1EDC),
      textColor: Colors.white,
      fontSize: 16.sp,
      height: 70.h,
      width: double.infinity,
      radius: 30,
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Text(
          "Secured by Swappid",
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _onTransferPressed() {
    // Show success modal
    SuccessModals.showSuccessModal(
      context,
      title: "Successful!",
      message:
          "Your crypto purchase was successful, you'll receive a confirmation email shortly.",
      buttons: [
        SuccessModalButton(
          text: "Home",
          isPrimary: true,
          onPressed: () {
            Navigator.of(context).pop(); // Close modal
            Navigator.of(context, rootNavigator: true)
                .pushNamedAndRemoveUntil('/main-navigation', (route) => false);
          },
        ),
        SuccessModalButton(
          text: "Share Receipt",
          isPrimary: false,
          onPressed: () {
            // TODO: Implement share receipt functionality
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Receipt shared!')),
            );
          },
        ),
      ],
    );
  }
}
