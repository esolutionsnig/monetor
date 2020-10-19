import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class ChartLabel extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;

  const ChartLabel({
    Key key,
    this.icon,
    this.iconColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: customShadowSmall,
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
