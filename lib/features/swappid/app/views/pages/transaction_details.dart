import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetailsPage extends StatefulWidget {
  static const route = "/transaction-details";

  const TransactionDetailsPage({
    super.key,
  });

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  bool get isPending =>
      ModalRoute.of(context)?.settings.arguments as bool? ?? false;

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

                    // Transaction summary
                    _buildTransactionSummary(),
                    SizedBox(height: 32.h),

                    // Transaction details
                    _buildTransactionDetails(),
                    SizedBox(height: 32.h),

                    // Payment method details
                    _buildPaymentMethodDetails(),
                    SizedBox(height: 20.h),
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
                    fontFamily: 'Satoshi',
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
                "Transaction Details",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
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

  Widget _buildTransactionSummary() {
    final statusColor = isPending ? Color(0xFFEDA145) : Color(0xFF17C151);
    final statusIcon = isPending ? Icons.warning : Icons.check_circle;
    final statusText = isPending ? "Pending Verification" : "Completed";

    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: Color(0xFF5C1EDC).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.currency_bitcoin,
              size: 40.sp,
              color: Color(0xFF5C1EDC),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Buy BTC with NGN",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "₦25,000 NGN",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "0.000456 BTC",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                statusIcon,
                size: 16.sp,
                color: statusColor,
              ),
              SizedBox(width: 4.w),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionDetails() {
    final details = [
      {"label": "Amount", "value": "0.000456 BTC"},
      {"label": "Fiat Value", "value": "₦25,000 NGN"},
      {"label": "Timestamp", "value": "28 May, 2025 4:30 PM"},
      {"label": "Transaction ID", "value": "SWA3141...", "canCopy": true},
      {"label": "Wallet Address", "value": "1f79d5f3ad...", "canCopy": true},
      {"label": "Network", "value": "Bitcoin (Mainnet)"},
      {"label": "Fee Charged", "value": "0.06"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transaction Details",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: details.map((detail) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detail["label"] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          detail["value"] as String,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        if (detail["canCopy"] == true) ...[
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () {
                              // TODO: Copy to clipboard
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
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Method",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildDetailRow("Payment Method", "Pay with Bank Transfer"),
              _buildDetailRow("Account Number", "3001202234", canCopy: true),
              _buildDetailRow("Bank Name", "Wema Bank"),
              _buildDetailRow("Account Name", "Swappid Technologies"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool canCopy = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
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
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              if (canCopy) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    // TODO: Copy to clipboard
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
}
