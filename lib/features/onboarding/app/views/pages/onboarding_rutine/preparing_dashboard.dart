import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreparingDashboardPage extends StatefulWidget {
  static const route = '/preparing-dashboard';
  const PreparingDashboardPage({Key? key}) : super(key: key);

  @override
  State<PreparingDashboardPage> createState() => _PreparingDashboardPageState();
}

class _PreparingDashboardPageState extends State<PreparingDashboardPage> {
  @override
  void initState() {
    super.initState();
    // Simulate dashboard preparation
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/main-navigation', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text('KYC',
      //       style: TextStyle(color: Colors.black, fontSize: 16)),
      //   centerTitle: false,
      //   toolbarHeight: 48,
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.w,
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xFFD1C3F7),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF5C1EDC)),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Preparing your dashboard',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'This should take a few moment.....',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
