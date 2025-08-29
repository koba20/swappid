import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';

class BankVerificationPage extends StatefulWidget {
  static const route = '/bank-verification';
  const BankVerificationPage({Key? key}) : super(key: key);

  @override
  State<BankVerificationPage> createState() => _BankVerificationPageState();
}

class _BankVerificationPageState extends State<BankVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountController = TextEditingController();
  String? _bank;
  final List<String> _banks = [
    'Access Bank',
    'GTBank',
    'UBA',
    'Zenith Bank',
    'First Bank',
    'Other',
  ];
  bool _verified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Back',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        centerTitle: false,
        toolbarHeight: 48,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _verified ? _successContent(context) : _formContent(context),
      ),
    );
  }

  Widget _formContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Bank Verification Number',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Please provide your bank details to continue',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 28.h),
              Text('Select Bank',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14.5.sp)),
              SizedBox(height: 6.h),
              DropdownButtonFormField<String>(
                value: _bank,
                items: _banks
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: 15.sp))))
                    .toList(),
                onChanged: (val) => setState(() => _bank = val),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(color: Color(0xFFD1C3F7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(color: Color(0xFFD1C3F7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide:
                        BorderSide(color: Color(0xFF5C1EDC), width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Text('Account Number',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14.5.sp)),
              SizedBox(height: 6.h),
              TextFormField(
                controller: _accountController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 15.sp),
                decoration: InputDecoration(
                  hintText: 'Enter your account number',
                  hintStyle: TextStyle(
                      fontSize: 15.sp, color: Colors.black.withOpacity(0.4)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(color: Color(0xFFD1C3F7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide: BorderSide(color: Color(0xFFD1C3F7)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                    borderSide:
                        BorderSide(color: Color(0xFF5C1EDC), width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              SButton(
                text: 'Verify My Account',
                backgroundColor: Color(0xFF5C1EDC), // or your brand purple
                textColor: Colors.white,
                fontSize: 16.sp,
                height: 70.h,
                width: double.infinity,
                radius: 30, // or leave out for auto-pill
                onPressed: () {
                  setState(() => _verified = true);
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _successContent(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE7F9EF),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(32),
              child:
                  Icon(Icons.check_circle, color: Color(0xFF17C151), size: 64),
            ),
            SizedBox(height: 32.h),
            Text(
              'Bank Verified',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Your bank account has been successfully verified.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 40.h),
            SButton(
              text: 'Continue',
              backgroundColor: Color(0xFF5C1EDC),
              textColor: Colors.white,
              fontSize: 16.sp,
              height: 48.h,
              width: double.infinity,
              radius: 24,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/dashboard', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
