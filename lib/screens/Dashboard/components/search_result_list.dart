import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/components/plan_tile.dart';
import 'package:moneytor/screens/Transaction/new_transaction._screen.dart';
import 'package:moneytor/screens/Transaction/transaction_detail.dart';
import 'package:provider/provider.dart';

class SearchResultList extends StatefulWidget {
  @override
  _SearchResultListState createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
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
                  "Total Plans Found: ".toUpperCase() +
                      "${numberFormat.format(plans.length)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text("No record Found"),
        ),
      );
    }
  }
}
