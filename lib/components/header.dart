import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/services/auth.dart';

class Header extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi Ernest",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Welcome, You Have 4 Active Plans",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            children: [
              HeaderIconButton(
                color1: kScaffoldBackgroundColor,
                color2: kSecondaryColor,
                color3: kScaffoldBackgroundColor,
                icon: Icons.add,
                press: () {
                  print("object");
                },
              ),
              SizedBox(width: 7),
              HeaderIconButton(
                color1: kScaffoldBackgroundColor2,
                color2: kScaffoldBackgroundColor2,
                color3: kScaffoldBackgroundColor2,
                icon: Icons.logout,
                iconColor: kSecondaryColor,
                press: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
