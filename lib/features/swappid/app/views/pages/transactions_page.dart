import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'transaction_details.dart';

class TransactionsPage extends StatefulWidget {
  static const route = "/transactions";

  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final TextEditingController _searchController = TextEditingController();

  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = [
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Successful",
      "statusColor": Color(0xFF10B981),
      "isPending": false,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Pending Verification",
      "statusColor": Color(0xFFFF9500),
      "isPending": true,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Successful",
      "statusColor": Color(0xFF10B981),
      "isPending": false,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Successful",
      "statusColor": Color(0xFF10B981),
      "isPending": false,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Successful",
      "statusColor": Color(0xFF10B981),
      "isPending": false,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Pending Verification",
      "statusColor": Color(0xFFFF9500),
      "isPending": true,
    },
    {
      "type": "Buy BTC",
      "amount": "0.00454 BTC",
      "date": "June 3, 10:11 PM",
      "status": "Pending Verification",
      "statusColor": Color(0xFFFF9500),
      "isPending": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Search bar
            _buildSearchBar(),

            // Transactions list
            Expanded(
              child: _buildTransactionsList(),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Transactions",
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                "Filter",
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: _showFilterBottomSheet,
                child: Icon(
                  Icons.tune,
                  size: 20.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20.sp,
            color: Colors.grey[600],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 16.sp,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Search Transactions",
                hintStyle: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final transaction = _transactions[index];
        return _buildTransactionItem(transaction);
      },
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          TransactionDetailsPage.route,
          arguments: transaction["isPending"],
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
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
            // Bitcoin icon
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

            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction["type"],
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    transaction["date"],
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 12.sp,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            // Amount and status
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction["amount"],
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),

                // Status badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: transaction["statusColor"].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (transaction["isPending"]) ...[
                        Icon(
                          Icons.warning,
                          size: 12.sp,
                          color: transaction["statusColor"],
                        ),
                        SizedBox(width: 4.w),
                      ] else ...[
                        Icon(
                          Icons.check_circle,
                          size: 12.sp,
                          color: transaction["statusColor"],
                        ),
                        SizedBox(width: 4.w),
                      ],
                      Text(
                        transaction["status"],
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: transaction["statusColor"],
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
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filter Transactions",
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),

            // Filter options
            _buildFilterOption("All Transactions", true),
            _buildFilterOption("Successful", false),
            _buildFilterOption("Pending", false),
            _buildFilterOption("Failed", false),

            SizedBox(height: 20.h),

            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5C1EDC),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Apply Filter",
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // Handle filter selection
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color:
              isSelected ? Color(0xFF5C1EDC).withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(0xFF5C1EDC) : Colors.grey[200]!,
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Color(0xFF5C1EDC) : Colors.black,
              ),
            ),
            Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                size: 16.sp,
                color: Color(0xFF5C1EDC),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
