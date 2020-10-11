import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/constants.dart';

class AccountDetails extends StatelessWidget {
  final NumberFormat numberFormat = NumberFormat('##,###', 'en_US');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recentTransactions
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item['name']} Amount:",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "₦",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: pieColors[
                                      recentTransactions.indexOf(item)],
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                "${numberFormat.format(item['amount'])}",
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                  color: pieColors[
                                      recentTransactions.indexOf(item)],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 1, top: 20, bottom: 20, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 220,
                  child: Text(
                    "House Rent Progress House Rent due is wey Progress House Rent Progress",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        boxShadow: customShadow,
                        color: kHalfwayColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "o".toUpperCase(),
                          style: TextStyle(
                            color: kScaffoldBackgroundColor,
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "On-Going",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
