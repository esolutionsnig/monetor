import 'package:flutter/material.dart';
import 'package:moneytor/components/constants.dart';
import 'package:intl/intl.dart';

class RecentTransactionList extends StatelessWidget {
  final String title, subtitle;
  final int amount;
  final IconData icon;
  RecentTransactionList(
      {Key key, this.title, this.subtitle, this.amount, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("##,###", "en_US");

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: recentTransactions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: kScaffoldBackgroundColor2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          "12-09",
                          style: TextStyle(
                            fontSize: 12,
                            color: kSecondaryColor,
                          ),
                        ),
                        Divider(),
                        Text(
                          "2020",
                          style: TextStyle(
                            fontSize: 13,
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "subtitle",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₦',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: kCompletedColor),
                    ),
                    Text(
                      '15,520 ',
                      // '+' + '₦' + "${numberFormat.format(amount)}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kCompletedColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
