import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Dashboard/components/recent_transaction_list.dart';
import 'package:moneytor/Screens/Transaction/components/background.dart';
import 'package:moneytor/Screens/Transaction/components/transaction_card.dart';
import 'package:moneytor/Screens/Transaction/components/transaction_chart.dart';
import 'package:moneytor/components/components.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Background(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              child: TransactionHeader(),
            ),
            TransactionCard(),
            TransactionChart(),
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
                    title: "Fund Account",
                    backgroundColor: kScaffoldBackgroundColor,
                    textColor: kSecondaryColor,
                    icon: Icons.add,
                    iconColor: kSecondaryColor,
                    press: () {
                      print("object");
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
      ),
    );
  }
}
