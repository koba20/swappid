import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swappid/core/widgets/buttons/app_button.dart';
import 'package:swappid/features/onboarding/app/views/pages/onboarding_rutine/bvn_verification.dart';

class KYCSelectionPage extends StatefulWidget {
  static const route = '/kyc-selection';
  const KYCSelectionPage({Key? key}) : super(key: key);

  @override
  State<KYCSelectionPage> createState() => _KYCSelectionPageState();
}

class _KYCSelectionPageState extends State<KYCSelectionPage> {
  String? _selectedOption;

  final List<Map<String, dynamic>> _kycOptions = [
    {
      'title': 'Bank Verification Number (BVN)',
      'description': 'Recommended',
      'icon': Icons.account_balance,
      'route': '/bvn-verification',
      'isRecommended': true,
    },
    {
      'title': 'National Identification Number (NIN)',
      'description': 'Requires your 11-digit NIN number',
      'icon': Icons.credit_card,
      'route': '/nin-verification',
      'isRecommended': false,
    },
    {
      'title': 'Passport Number',
      'description': 'Requires your passport identification number',
      'icon': Icons.flight_takeoff,
      'route': '/passport-verification',
      'isRecommended': false,
    },
    {
      'title': 'Driver\'s Licence',
      'description': 'Requires your driver\'s license number',
      'icon': Icons.drive_eta,
      'route': '/license-verification',
      'isRecommended': false,
    },
  ];

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
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Skip for later
            },
            child: Text(
              'Skip for Later',
              style: TextStyle(
                color: Color(0xFF5C1EDC),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'Verify your Identity',
                style: TextStyle(
                  fontFamily: 'FunnelDisplay',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Please enter all information as shown on your government-issued ID.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 28.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _kycOptions.length,
                  itemBuilder: (context, index) {
                    final option = _kycOptions[index];
                    final isSelected = _selectedOption == option['title'];

                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Color(0xFF5C1EDC)
                              : Color(0xFFD1C3F7),
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xFF5C1EDC).withOpacity(0.1)
                                : Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            option['icon'],
                            color: isSelected
                                ? Color(0xFF5C1EDC)
                                : Colors.grey[600],
                            size: 24,
                          ),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                option['title'],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            if (option['isRecommended'])
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFF5C1EDC),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Recommended',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        subtitle: Text(
                          option['description'],
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color:
                              isSelected ? Color(0xFF5C1EDC) : Colors.grey[400],
                          size: 16,
                        ),
                        onTap: () {
                          setState(() {
                            _selectedOption = option['title'];
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              SButton(
                text: 'Verify My Account',
                backgroundColor: Color(0xFF5C1EDC), // or your brand purple
                textColor: Colors.white,
                fontSize: 16.sp,
                height: 70.h,
                width: double.infinity,
                radius: 30, // or leave out for auto-pill
                onPressed: _selectedOption != null
                    ? () {
                        // Navigate to BVN verification for now
                        Navigator.pushNamed(context, BVNVerificationPage.route);
                      }
                    : null,
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
