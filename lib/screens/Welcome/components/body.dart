import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Welcome/components/background.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/screens/authenticate/sign_in_screen.dart';
import 'package:moneytor/screens/authenticate/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // The size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MONEY",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: kSecondaryColor,
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  "TOR",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kSecondaryColor,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Container(
              child: Image.asset(
                "assets/images/cl.png",
                height: size.height * 0.55,
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            RoundedButton(
              text: "Sign In",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignInScreen();
                    },
                  ),
                );
              },
              color: kSecondaryColor,
              textColor: kPrimaryColor,
            ),
            RoundedButton(
              text: "Create Free Account",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
              color: kSecondaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
