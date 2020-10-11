import 'package:flutter/material.dart';
import 'package:moneytor/components/constants.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account yet ? " : "Already have an Account ? ",
          style: TextStyle(
            color: kTextColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Me Up ".toUpperCase() : "Sign Me In".toUpperCase(),
            style:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
