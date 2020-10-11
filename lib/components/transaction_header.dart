import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class TransactionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderIconButton(
            color1: kScaffoldBackgroundColor2,
            color2: kScaffoldBackgroundColor2,
            color3: kScaffoldBackgroundColor2,
            icon: Icons.arrow_back,
            iconColor: kSecondaryColor,
            press: () {
              print("object 2");
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Transaction",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Transaction Title Here",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            children: [
              HeaderIconButton(
                color1: kScaffoldBackgroundColor2,
                color2: kScaffoldBackgroundColor2,
                color3: kScaffoldBackgroundColor2,
                icon: Icons.logout,
                iconColor: kSecondaryColor,
                press: () {
                  print("object 2");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
