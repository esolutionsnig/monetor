import 'package:flutter/material.dart';
import 'package:moneytor/models/user_model.dart';
import 'package:moneytor/screens/Dashboard/dashboard_screen.dart';
import 'package:moneytor/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    // Return either home or authenticate
    if (user == null) {
      return WelcomeScreen();
    } else {
      return DashboardScreen();
    }
  }
}
