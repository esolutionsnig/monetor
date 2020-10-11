import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Dashboard/components/recent_transaction_list.dart';
import 'package:moneytor/Screens/Transaction/transaction_screen.dart';
import 'package:moneytor/components/components.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            child: WallerHeader(),
          ),
          Container(
            height: 230,
            child: AccountBalanceCard(),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                ViewMoreButtion(
                  title: "View More",
                  backgroundColor: kScaffoldBackgroundColor,
                  textColor: kSecondaryColor,
                  icon: Icons.arrow_forward_ios_sharp,
                  iconColor: kSecondaryColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransactionScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: RecentTransactionList(),
          ),
        ],
      ),
    );
  }
}
