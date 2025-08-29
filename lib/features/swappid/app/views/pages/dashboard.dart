import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/crypto_modals.dart';
import 'transaction_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const route = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isBalanceVisible = true;
  String _balance = "₦ 43,850.89";
  String _lastLogin = "Tue, June 24, 15:12 PM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 90.h),
        child: FloatingActionButton(
          onPressed: () {
            // FAB functionality - could be for completing actions
          },
          backgroundColor: Color(0xFF5C1EDC),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Main content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                    // Header with profile and greeting
                    _buildHeader(),
                    SizedBox(height: 24.h),

                    // Balance section
                    _buildBalanceSection(),
                    SizedBox(height: 24.h),

                    // Action buttons
                    _buildActionButtons(),
                    SizedBox(height: 24.h),

                    // Know what you buy card
                    _buildCryptoInfoCard(),
                    SizedBox(height: 24.h),

                    // Recent transactions
                    _buildRecentTransactions(),
                    SizedBox(height: 100.h), // Space for FAB
                  ],
                ),
              ),
            ),

            // Bottom navigation
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        // Profile picture
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/img-welcome.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Greeting text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Good Morning, ",
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.wb_sunny,
                    size: 16.sp,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "John Doe",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        // Support and notification icons
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.headphones,
                size: 20.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications,
                size: 20.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5C1EDC),
            Color(0xFF7C3AED),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF5C1EDC).withOpacity(0.3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Last Login: $_lastLogin",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "+ Add Funds",
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5C1EDC),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "NGN Balance",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.flag,
                        size: 16.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16.sp,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    _isBalanceVisible ? _balance : "₦ ****",
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                child: Icon(
                  _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  size: 24.sp,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final actions = [
      {
        "icon": Icons.keyboard_arrow_down,
        "label": "Buy Crypto",
        "onTap": _showBuyCryptoFlow
      },
      {"icon": Icons.keyboard_arrow_up, "label": "Sell Crypto", "onTap": () {}},
      {"icon": Icons.flight, "label": "Book a Flight", "onTap": () {}},
      {"icon": Icons.more_vert, "label": "More", "onTap": () {}},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions.map((action) {
        return GestureDetector(
          onTap: action["onTap"] as VoidCallback,
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  action["icon"] as IconData,
                  size: 24.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                action["label"] as String,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCryptoInfoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Know what you buy",
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () => CryptoModals.showCryptoDetailsModal(context, "Tether"),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xFF3B82F6),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF10B981),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "T",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tether (USDT)",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "This is a stablecoin, meaning it's pegged 1:1 to the US dollar. It doesn't fluctuate like other cryptos and is often used to hold value between other cryptocurrencies.",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 14.sp,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Color(0xFF3B82F6),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "377 Fill x 122 Hug",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Transactions",
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, TransactionDetailsPage.route),
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
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF9500).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Color(0xFFFF9500),
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buy BTC",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "June 3, 10:11 PM",
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "0.00456 BTC",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9500).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.warning,
                            size: 12.sp,
                            color: Color(0xFFFF9500),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Pending Verification",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF9500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        // Second transaction
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
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Color(0xFFFF9500).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.currency_bitcoin,
                  color: Color(0xFFFF9500),
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buy BTC",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "June 2, 9:30 AM",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12.sp,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "0.0045 BTC",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    final items = [
      {"icon": Icons.home, "label": "Home", "route": null},
      {
        "icon": Icons.local_offer,
        "label": "Transactions",
        "route": "/transactions"
      },
      {"icon": Icons.person, "label": "Profile", "route": null},
      {"icon": Icons.settings, "label": "Settings", "route": null},
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == 0; // Home is selected

          return GestureDetector(
            onTap: () {
              if (item["route"] != null) {
                Navigator.pushNamed(context, item["route"] as String);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item["icon"] as IconData,
                  size: 24.sp,
                  color: isSelected ? Colors.black : Colors.grey[600],
                ),
                SizedBox(height: 4.h),
                Text(
                  item["label"] as String,
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showBuyCryptoFlow() {
    Navigator.pushNamed(context, '/buy-crypto/amount-input');
  }
}
