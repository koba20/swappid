import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'wallet_address_screen.dart';
import '../../widgets/crypto_modals.dart';

class AmountInputScreen extends StatefulWidget {
  static const route = "/buy-crypto/amount-input";

  const AmountInputScreen({super.key});

  @override
  State<AmountInputScreen> createState() => _AmountInputScreenState();
}

class _AmountInputScreenState extends State<AmountInputScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedCrypto = "BTC";
  String _selectedFiat = "NGN";
  double _exchangeRate = 80000.0; // 1 BTC = ₦80,000
  int _expirySeconds = 60;
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _isTimerRunning = false;
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

  double get _ngnAmount {
    final btcAmount = double.tryParse(_amountController.text) ?? 0.0;
    return btcAmount * _exchangeRate;
  }

  bool get _canContinue {
    return _amountController.text.isNotEmpty &&
        double.tryParse(_amountController.text) != null &&
        double.parse(_amountController.text) > 0;
  }

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

                    // Currency selection
                    _buildCurrencySelection(),
                    SizedBox(height: 24.h),

                    // Amount input
                    _buildAmountInput(),
                    SizedBox(height: 24.h),

                    // Transaction details
                    _buildTransactionDetails(),
                    SizedBox(height: 32.h),

                    // Continue button
                    _buildContinueButton(),
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
                SizedBox(width: 4.w),
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
                "Buy Crypto",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svgs/callcenter.svg',
            width: 40.w,
            height: 40.w,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencySelection() {
    return Row(
      children: [
        // Buy crypto dropdown
        Expanded(
          child: GestureDetector(
            onTap: () {
              CryptoModals.showCryptoSelectionModal(
                context,
                selectedCrypto: _selectedCrypto,
                onCryptoSelected: (crypto) {
                  setState(() {
                    _selectedCrypto = crypto;
                  });
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/Bitcoin.svg',
                    width: 16.w,
                    height: 16.w,
                    colorFilter:
                        ColorFilter.mode(Color(0xFF5C1EDC), BlendMode.srcIn),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Buy $_selectedCrypto",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down,
                      size: 16.sp, color: Colors.grey[600]),
                ],
              ),
            ),
          ),
        ),
        // Exchange arrow in the middle
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Icon(
            Icons.swap_horiz,
            size: 20.sp,
            color: Colors.grey[600],
          ),
        ),
        // With currency dropdown
        Expanded(
          child: GestureDetector(
            onTap: () {
              CryptoModals.showFiatSelectionModal(
                context,
                selectedFiat: _selectedFiat,
                onFiatSelected: (fiat) {
                  setState(() {
                    _selectedFiat = fiat;
                  });
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Text(
                    "🇳🇬",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "With $_selectedFiat",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down,
                      size: 16.sp, color: Colors.grey[600]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Amount",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              // BTC selector on the left
              GestureDetector(
                onTap: () {
                  CryptoModals.showCryptoSelectionModal(
                    context,
                    selectedCrypto: _selectedCrypto,
                    onCryptoSelected: (crypto) {
                      setState(() {
                        _selectedCrypto = crypto;
                      });
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF5C1EDC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCrypto,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5C1EDC),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 12.sp,
                        color: Color(0xFF5C1EDC),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Amount input field
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "0.00",
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionDetails() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You'll Spend:",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                "₦${_ngnAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Rate:",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                "1 $_selectedCrypto = ₦${_exchangeRate.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Expires in",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Color(0xFF17C151),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$_expirySeconds seconds",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return SButton(
      text: "Continue",
      onPressed: _canContinue ? _onContinuePressed : null,
      backgroundColor: _canContinue
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

  void _onContinuePressed() {
    Navigator.of(context, rootNavigator: true)
        .pushNamed(WalletAddressScreen.route);
  }
}
