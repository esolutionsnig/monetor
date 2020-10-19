import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/components/plan_tile.dart';
import 'package:moneytor/screens/Transaction/new_transaction._screen.dart';
import 'package:moneytor/screens/Transaction/transaction_detail.dart';
import 'package:provider/provider.dart';

class PlanList extends StatefulWidget {
  @override
  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("##,###", "en_US");
    final plans = Provider.of<List<PlanModel>>(context) ?? [];
    // print(plans.length);
    if (plans.length > 0) {
      var reversedList = new List.from(plans.reversed);
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Plans: ".toUpperCase() +
                      "${numberFormat.format(plans.length)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: customShadowSmall,
                        color: kScaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: kSecondaryColor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: customShadowSmall,
                        color: kScaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reversedList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransactionDetail(plan: reversedList[index]);
                        },
                      ),
                    );
                  },
                  child: PlanTile(plan: reversedList[index]),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewTransactionScreen();
                },
              ),
            );
          },
          child: Container(
            width: 255,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: customShadowSmall,
              borderRadius: BorderRadius.circular(50),
              color: kSecondaryColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  size: 40,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 15),
                Text(
                  "New Plan".toUpperCase(),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
