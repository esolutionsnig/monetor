import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class AppFabButton extends StatelessWidget {
  final Function press;
  final String title;
  final IconData icon;
  final bool isExtended;

  AppFabButton({this.isExtended = false, this.press, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: RawMaterialButton(
        elevation: 5.0,
        shape: isExtended
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              )
            : CircleBorder(),
        onPressed: press,
        fillColor: kSecondaryColor,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: isExtended
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                )
              : Icon(
                  icon,
                  color: kPrimaryColor,
                ),
        ),
      ),
    );
  }
}
