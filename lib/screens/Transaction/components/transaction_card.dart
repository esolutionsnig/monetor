import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Transaction/components/account_details.dart';
import 'package:moneytor/components/constants.dart';

class TransactionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: kScaffoldBackgroundColor,
        boxShadow: customShadow,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: -40,
            bottom: 10,
            left: 70,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Positioned.fill(
            top: 10,
            bottom: 20,
            left: 65,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Positioned.fill(
            left: 60,
            top: 40,
            bottom: 30,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Positioned.fill(
            left: 55,
            top: 65,
            bottom: 38,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Positioned.fill(
            left: 55,
            top: 85,
            bottom: 44,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Positioned.fill(
            left: 55,
            top: 100,
            bottom: 50,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: customShadow,
                shape: BoxShape.circle,
                color: kScaffoldBackgroundColor.withAlpha(225),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: AccountDetails(),
          ),
        ],
      ),
    );
  }
}
