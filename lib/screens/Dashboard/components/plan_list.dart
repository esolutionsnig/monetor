import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/components/plan_tile.dart';
import 'package:moneytor/screens/Transaction/new_transaction._screen.dart';
import 'package:provider/provider.dart';

class PlanList extends StatefulWidget {
  @override
  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<List<PlanModel>>(context) ?? [];
    // print(plans.length);
    if (plans.length > 0) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return PlanTile(plan: plans[index]);
        },
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
