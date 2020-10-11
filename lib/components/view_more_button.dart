import 'package:flutter/material.dart';
import 'package:moneytor/components/constants.dart';

class ViewMoreButtion extends StatelessWidget {
  final Function press;
  final Color backgroundColor, textColor, iconColor;
  final String title;
  final IconData icon;
  const ViewMoreButtion({
    Key key,
    this.press,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          boxShadow: customShadow,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 6),
            Icon(
              icon,
              size: 14,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
