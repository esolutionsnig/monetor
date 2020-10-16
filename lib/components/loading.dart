import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: kScaffoldBackgroundColor,
            boxShadow: customShadow,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    backgroundColor: kSecondaryLightColor,
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "m",
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
