import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class PlanSelector extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor, color;
  final Function press;
  const PlanSelector({
    Key key,
    this.title,
    this.icon,
    this.backgroundColor,
    this.color,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: customShadowSmall,
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
