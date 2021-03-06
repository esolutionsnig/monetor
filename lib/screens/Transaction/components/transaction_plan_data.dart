import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/models/models.dart';

class TransactionPlanData extends StatelessWidget {
  final PlanModel plan;
  final Color backgroundColor, color;
  TransactionPlanData({this.plan, this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("##,###", "en_US");

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Target Amount:",
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "₦",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: color,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "${numberFormat.format(plan.targetAmount)}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Amount Raised:",
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "₦",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: color,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        "${numberFormat.format(plan.raisedAmount)}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          plan.status == 'Running' ? "R" : "C",
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      plan.status == 'Running' ? "Running" : "Completed",
                      style: TextStyle(
                        fontSize: 11,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.subTitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
