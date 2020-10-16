import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/components/plan_tile_data.dart';

class PlanTile extends StatelessWidget {
  final PlanModel plan;
  PlanTile({this.plan});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = kPrimaryColor;
    if (plan.status == 'Running') {
      backgroundColor = kHalfwayColor;
    } else {
      backgroundColor = kCompletedColor;
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: customShadowSmall,
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
                color: backgroundColor.withAlpha(225),
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
                color: backgroundColor.withAlpha(225),
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
                color: backgroundColor.withAlpha(225),
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
                color: backgroundColor.withAlpha(225),
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
                color: backgroundColor.withAlpha(225),
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
                color: backgroundColor.withAlpha(225),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: PlanTileData(
              plan: plan,
              color: kPrimaryColor,
              backgroundColor:
                  plan.status == 'Running' ? kHalfwayColor : kCompletedColor,
            ),
          ),
        ],
      ),
    );
  }
}
