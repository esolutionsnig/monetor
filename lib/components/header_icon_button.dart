import 'package:flutter/material.dart';
import 'package:moneytor/components/constants.dart';

class HeaderIconButton extends StatelessWidget {
  final Function press;
  final IconData icon;
  final Color color1, color2, color3, iconColor;

  const HeaderIconButton({
    Key key,
    this.press,
    this.icon,
    this.color1,
    this.color2,
    this.color3,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.08,
        decoration: BoxDecoration(
          boxShadow: customShadow,
          color: color1,
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: color2,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  color: color3,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: Icon(
                icon,
                size: 18,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
