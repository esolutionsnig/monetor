import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Transaction/components/pieChart.dart';
import 'package:moneytor/components/components.dart';

class TransactionChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transaction Chart".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recentTransactions
                    .map(
                      (item) => Padding(
                        padding: EdgeInsets.all(4),
                        child: ChartLabel(
                          icon: Icons.circle,
                          iconColor:
                              pieColors[recentTransactions.indexOf(item)],
                          title: item["name"],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          PieChart(),
        ],
      ),
    );
  }
}
