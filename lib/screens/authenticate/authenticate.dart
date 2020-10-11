import 'package:flutter/material.dart';
import 'package:moneytor/screens/authenticate/sign_in_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}
