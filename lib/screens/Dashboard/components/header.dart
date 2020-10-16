import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  final IconData icon;
  final String subtitle;
  const HomeHeader({
    Key key,
    @required this.size,
    this.name,
    this.icon,
    this.subtitle,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding - 10,
            ),
            height: 80,
            decoration: BoxDecoration(
              gradient: pinkGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 60,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
