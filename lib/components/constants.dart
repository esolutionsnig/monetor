import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFF880E4F);
// const kSecondaryLightColor = Color(0xFFFCE4EC);
const kSecondaryLightColor = Color(0xFFfaf0f3);
const kTextColor = Color(0xFF636363);
const kCompletedColor = Color(0xFF009688);
const kHalfwayColor = Color(0xFFFF9800);
const kStartedColor = Color(0xFFAF0000);
const kScaffoldBackgroundColor = Color(0xFFFFFFFF);
const kScaffoldBackgroundColor2 = Color(0xFFEFEFEF);

List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.5),
    spreadRadius: -5,
    offset: Offset(-5, -5),
    blurRadius: 30,
  ),
  BoxShadow(
    color: Colors.blue[900].withOpacity(.2),
    spreadRadius: 2,
    offset: Offset(7, 7),
    blurRadius: 20,
  ),
];

List recentTransactions = [
  {
    "name": "Target",
    "amount": 250000000,
  },
  {
    "name": "Completed",
    "amount": 50000000,
  }
];

List pieColors = [kSecondaryColor, kCompletedColor];
