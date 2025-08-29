import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoModals {
  // Crypto Selection Modal
  static void showCryptoSelectionModal(
    BuildContext context, {
    required Function(String) onCryptoSelected,
    String? selectedCrypto,
  }) {
    final cryptos = [
      {"name": "Tether (USDT)", "value": "USDT"},
      {"name": "Bitcoin (BTC)", "value": "BTC"},
      {"name": "Ethereum (ETH)", "value": "ETH"},
    ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Which crypto would you like to buy?",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),

            // Options
            ...cryptos.map((crypto) => _buildRadioOption(
                  context,
                  crypto["name"] as String,
                  crypto["value"] as String,
                  selectedCrypto == crypto["value"],
                  () {
                    onCryptoSelected(crypto["value"] as String);
                    Navigator.of(context).pop();
                  },
                )),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Fiat Selection Modal
  static void showFiatSelectionModal(
    BuildContext context, {
    required Function(String) onFiatSelected,
    String? selectedFiat,
  }) {
    final fiats = [
      {"name": "Nigerian Naira (NGN)", "value": "NGN"},
      {"name": "United States Dollars (USD)", "value": "USD"},
      {"name": "Great British Pounds (GBP)", "value": "GBP"},
      {"name": "The Euro (EUR)", "value": "EUR"},
    ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Which fiat would you like to buy with?",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),

            // Options
            ...fiats.map((fiat) => _buildRadioOption(
                  context,
                  fiat["name"] as String,
                  fiat["value"] as String,
                  selectedFiat == fiat["value"],
                  () {
                    onFiatSelected(fiat["value"] as String);
                    Navigator.of(context).pop();
                  },
                )),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Amount Input Modal
  static void showAmountInputModal(
    BuildContext context, {
    required Function(String, String) onAmountEntered,
    String selectedCurrency = "NGN",
    String selectedCrypto = "BTC",
  }) {
    final TextEditingController ngnController = TextEditingController();
    final TextEditingController cryptoController = TextEditingController();
    String selectedInput = "NGN";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                "Enter Amount",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),

              // NGN Input
              _buildAmountInput(
                context,
                "Amount in Naira (NGN)",
                "E.g. ₦20,000.00",
                ngnController,
                selectedInput == "NGN",
                () => setState(() => selectedInput = "NGN"),
              ),
              SizedBox(height: 16.h),

              // Crypto Input
              _buildAmountInput(
                context,
                "Amount in Bitcoin (BTC)",
                "E.g. 0.012384 BTC",
                cryptoController,
                selectedInput == "BTC",
                () => setState(() => selectedInput = "BTC"),
              ),
              SizedBox(height: 24.h),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onAmountEntered(ngnController.text, cryptoController.text);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5C1EDC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // Loading Modal - Generating Bank Account
  static void showGeneratingBankAccountModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Generating Bank Account...",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            LinearProgressIndicator(
              backgroundColor: Color(0xFFD1C3F7),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
            ),
            SizedBox(height: 16.h),
            Text(
              "Please wait while we generate your bank account. This should only take a moment.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  // Loading Modal - Verifying Payment
  static void showVerifyingPaymentModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),
            Text(
              "Verifying Your Payment...",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            LinearProgressIndicator(
              backgroundColor: Color(0xFFD1C3F7),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
            ),
            SizedBox(height: 16.h),
            Text(
              "Please wait while we confirm your bank transfer. This may take up to 5 minutes.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  // Crypto Details Modal
  static void showCryptoDetailsModal(BuildContext context, String cryptoName,
      {bool isAboveBottomNav = false}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: false,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => Container(
        margin: EdgeInsets.only(bottom: 80), // Push modal above bottom nav
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // Header
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios, size: 20.sp),
                ),
                SizedBox(width: 8.w),
                Text(
                  "What is $cryptoName?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Crypto Icon and Description
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF5C1EDC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Color(0xFF5C1EDC),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "Bitcoin is a decentralized digital currency that enables peer-to-peer transactions without the need for intermediaries.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Use Cases
            Text(
              "Use Cases",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            _buildBulletPoint("Long-term investment"),
            _buildBulletPoint("Peer-to-peer transfers"),
            _buildBulletPoint("Hedge against inflation"),
            SizedBox(height: 16.h),

            // Things to Note
            Text(
              "Things to Note",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            _buildBulletPoint("Highly volatile"),
            _buildBulletPoint("Transactions may take a few minutes"),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // Helper methods
  static Widget _buildRadioOption(
    BuildContext context,
    String title,
    String value,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFF5C1EDC).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[300]!,
          ),
        ),
        child: Row(
          children: [
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
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Color(0xFF5C1EDC) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildAmountInput(
    BuildContext context,
    String label,
    String placeholder,
    TextEditingController controller,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color:
              isSelected ? Color(0xFF5C1EDC).withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[300]!,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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

  static Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4.w,
            height: 4.w,
            margin: EdgeInsets.only(top: 8.h, right: 8.w),
            decoration: BoxDecoration(
              color: Color(0xFF5C1EDC),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
