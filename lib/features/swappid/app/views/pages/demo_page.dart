import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import 'transaction_details.dart';
import '../widgets/crypto_modals.dart';
import '../widgets/success_modals.dart';

class DemoPage extends StatelessWidget {
  static const route = "/demo";

  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Swappid App Demo',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard & Modal Components',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Select a component to view:',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 32.h),

            // Main Screens
            _buildSectionTitle('Main Screens'),
            SizedBox(height: 16.h),

            _buildDemoButton(
              context,
              'Dashboard',
              'Main dashboard with balance, actions, and transactions',
              Icons.dashboard,
              () => Navigator.pushNamed(context, Dashboard.route),
            ),

            _buildDemoButton(
              context,
              'Transaction Details (Completed)',
              'Transaction details page with completed status',
              Icons.receipt_long,
              () => Navigator.pushNamed(context, TransactionDetailsPage.route),
            ),

            _buildDemoButton(
              context,
              'Transaction Details (Pending)',
              'Transaction details page with pending status',
              Icons.pending,
              () => Navigator.pushNamed(
                context,
                TransactionDetailsPage.route,
                arguments: true,
              ),
            ),

            SizedBox(height: 32.h),

            // Modals
            _buildSectionTitle('Modal Components'),
            SizedBox(height: 16.h),

            _buildDemoButton(
              context,
              'Crypto Selection Modal',
              'Select which cryptocurrency to buy',
              Icons.currency_bitcoin,
              () => CryptoModals.showCryptoSelectionModal(
                context,
                onCryptoSelected: (crypto) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $crypto')),
                  );
                },
              ),
            ),

            _buildDemoButton(
              context,
              'Fiat Selection Modal',
              'Select which fiat currency to use',
              Icons.attach_money,
              () => CryptoModals.showFiatSelectionModal(
                context,
                onFiatSelected: (fiat) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $fiat')),
                  );
                },
              ),
            ),

            _buildDemoButton(
              context,
              'Amount Input Modal',
              'Enter amount in NGN or BTC',
              Icons.input,
              () => CryptoModals.showAmountInputModal(
                context,
                onAmountEntered: (ngnAmount, cryptoAmount) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('NGN: $ngnAmount, BTC: $cryptoAmount')),
                  );
                },
              ),
            ),

            _buildDemoButton(
              context,
              'Generating Bank Account Modal',
              'Loading modal for bank account generation',
              Icons.account_balance,
              () {
                CryptoModals.showGeneratingBankAccountModal(context);
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
              },
            ),

            _buildDemoButton(
              context,
              'Verifying Payment Modal',
              'Loading modal for payment verification',
              Icons.verified,
              () {
                CryptoModals.showVerifyingPaymentModal(context);
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
              },
            ),

            _buildDemoButton(
              context,
              'Crypto Details Modal',
              'Information about Bitcoin',
              Icons.info,
              () => CryptoModals.showCryptoDetailsModal(context, "Bitcoin"),
            ),

            _buildDemoButton(
              context,
              'Success Modal (Generic)',
              'Standard success modal with custom buttons',
              Icons.check_circle,
              () => SuccessModals.showSuccessModal(
                context,
                title: "Successful!",
                message:
                    "Your crypto purchase was successful, you'll receive a confirmation email shortly.",
                buttons: [
                  SuccessModalButton(
                    text: "Home",
                    isPrimary: true,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SuccessModalButton(
                    text: "Share Receipt",
                    isPrimary: false,
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Receipt shared!')),
                      );
                    },
                  ),
                ],
              ),
            ),

            _buildDemoButton(
              context,
              'Success Modal (KYC Required)',
              'Success modal with KYC requirement',
              Icons.verified_user,
              () => SuccessModals.showKYCSuccessModal(context),
            ),

            SizedBox(height: 32.h),

            // Complete Flow
            _buildSectionTitle('Complete Flow'),
            SizedBox(height: 16.h),

            _buildDemoButton(
              context,
              'Buy Crypto Complete Flow',
              'Complete flow from amount input to success modal',
              Icons.play_arrow,
              () => Navigator.pushNamed(context, '/buy-crypto/amount-input'),
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xFF5C1EDC),
      ),
    );
  }

  Widget _buildDemoButton(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
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
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF5C1EDC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Color(0xFF5C1EDC),
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
