import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dashboard.dart';
import 'transactions_page.dart';
import '../widgets/crypto_modals.dart';
import 'transaction_details.dart';

class MainNavigation extends StatefulWidget {
  static const route = "/main-navigation";

  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _buildTabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      navBarHeight: 70.h,
    );
  }

  List<PersistentTabConfig> _buildTabs() {
    return [
      PersistentTabConfig(
        screen: const DashboardContent(),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          title: "Home",
          textStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          activeForegroundColor: Colors.black,
          inactiveForegroundColor: Colors.grey[600]!,
        ),
      ),
      PersistentTabConfig(
        screen: const TransactionsPage(),
        item: ItemConfig(
          icon: const Icon(Icons.local_offer),
          title: "Transactions",
          textStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          activeForegroundColor: Colors.black,
          inactiveForegroundColor: Colors.grey[600]!,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfilePage(),
        item: ItemConfig(
          icon: const Icon(Icons.person),
          title: "Profile",
          textStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          activeForegroundColor: Colors.black,
          inactiveForegroundColor: Colors.grey[600]!,
        ),
      ),
      PersistentTabConfig(
        screen: const SettingsPage(),
        item: ItemConfig(
          icon: const Icon(Icons.settings),
          title: "Settings",
          textStyle: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          activeForegroundColor: Colors.black,
          inactiveForegroundColor: Colors.grey[600]!,
        ),
      ),
    ];
  }
}

// Dashboard content without the bottom navigation
class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  bool _isBalanceVisible = true;
  String _balance = "₦ 43,850.89";
  String _lastLogin = "Tue, June 24, 15:12 PM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        child: FloatingActionButton(
          onPressed: () {
            // FAB functionality - could be for completing actions
          },
          backgroundColor: Color(0xFF5C1EDC),
          shape: CircleBorder(),
          child: SvgPicture.asset(
            'assets/svgs/buycrypto.svg',
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      body: SafeArea(
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
                      Text(
                        "🇳🇬",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(width: 8.w),
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
        "iconPath": "assets/svgs/buycrypto.svg",
        "label": "Buy Crypto",
        "onTap": _showBuyCryptoFlow,
        "isSvg": true
      },
      {
        "iconPath": "assets/svgs/sellcrypto.svg",
        "label": "Sell Crypto",
        "onTap": () {},
        "isSvg": true
      },
      {
        "icon": Icons.flight,
        "label": "Book a Flight",
        "onTap": () {},
        "isSvg": false
      },
      {
        "icon": Icons.more_vert,
        "label": "More",
        "onTap": () {},
        "isSvg": false
      },
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: actions.map((action) {
          return Expanded(
            child: GestureDetector(
              onTap: action["onTap"] as VoidCallback,
              child: Column(
                children: [
                  Container(
                    width: 80.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: action["isSvg"] == true
                          ? SvgPicture.asset(
                              action["iconPath"] as String,
                              width: 24.w,
                              height: 24.w,
                              colorFilter: ColorFilter.mode(
                                  Colors.grey[700]!, BlendMode.srcIn),
                            )
                          : Icon(
                              action["icon"] as IconData,
                              size: 24.sp,
                              color: Colors.grey[700],
                            ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    action["label"] as String,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCryptoInfoCard() {
    final cryptoData = [
      {
        "name": "Tether (USDT)",
        "symbol": "USDT",
        "iconPath": "assets/svgs/Usdt.svg",
        "iconColor": Color(0xFF10B981),
        "description":
            "This is a stablecoin, meaning it's pegged 1:1 to the US dollar. It doesn't fluctuate like other cryptos and is often used to hold value between other cryptocurrencies.",
      },
      {
        "name": "Bitcoin",
        "symbol": "BTC",
        "iconPath": "assets/svgs/Bitcoin.svg",
        "iconColor": Color(0xFFFF9500),
        "description":
            "Launched in 2009, Bitcoin is often called \"digital gold.\" It's designed for peer-to-peer payment. It's decentralized, meaning no government or central authority controls it.",
      },
      {
        "name": "Ethereum (ETH)",
        "symbol": "ETH",
        "iconPath": "assets/svgs/Eth.svg",
        "iconColor": Color(0xFF60A5FA),
        "description":
            "Ethereum is a platform that enables developers to build decentralized apps (dApps) and smart contracts. ETH is its native currency, used to power transactions.",
      },
    ];

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
        SizedBox(
          height: 175.h,
          child: PageView.builder(
            controller: PageController(viewportFraction: 1),
            padEnds: false,
            itemCount: cryptoData.length,
            itemBuilder: (context, index) {
              final crypto = cryptoData[index];
              return Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: GestureDetector(
                  onTap: () => CryptoModals.showCryptoDetailsModal(
                      context, crypto["name"] as String,
                      isAboveBottomNav: true),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12.w, 16.w, 16.w, 16.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFCEBCE9),
                          Color(0xFFC7C1E6),
                          Color(0xFFBDC9E2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: crypto["iconColor"] as Color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  crypto["iconPath"] as String,
                                  width: 24.w,
                                  height: 24.w,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    crypto["name"] as String,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    crypto["description"] as String,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 14.sp,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
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
              );
            },
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
        // First transaction
        GestureDetector(
          onTap: () => Navigator.of(context, rootNavigator: true)
              .pushNamed(TransactionDetailsPage.route, arguments: true),
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
                  child: SvgPicture.asset(
                    'assets/svgs/Bitcoin.svg',
                    width: 20.w,
                    height: 20.w,
                    colorFilter:
                        ColorFilter.mode(Color(0xFFFF9500), BlendMode.srcIn),
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
                          SvgPicture.asset(
                            'assets/svgs/notification.svg',
                            width: 12.w,
                            height: 12.w,
                            colorFilter: ColorFilter.mode(
                                Color(0xFFFF9500), BlendMode.srcIn),
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
                child: SvgPicture.asset(
                  'assets/svgs/Bitcoin.svg',
                  width: 20.w,
                  height: 20.w,
                  colorFilter:
                      ColorFilter.mode(Color(0xFFFF9500), BlendMode.srcIn),
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

  void _showBuyCryptoFlow() {
    Navigator.of(context, rootNavigator: true)
        .pushNamed('/buy-crypto/amount-input');
  }
}

// Placeholder pages for other tabs
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Text(
          "Settings Page",
          style: TextStyle(
            fontFamily: 'Satoshi',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
