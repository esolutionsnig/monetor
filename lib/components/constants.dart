import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFF880E4F);
const kErrorColor = Color(0xFFAF0000);
// const kSecondaryLightColor = Color(0xFFFCE4EC);
const kSecondaryLightColor = Color(0xFFfaf0f3);
const kTextColor = Color(0xFF636363);
const kGreyColor = Color(0xFFCCCCCC);
const kCompletedColor = Color(0xFF009688);
const kHalfwayColor = Color(0xFFE65100);
const kStartedColor = Color(0xFFAF0000);
const kScaffoldBackgroundColor = Color(0xFFFFFFFF);
const kScaffoldBackgroundColor2 = Color(0xFFEFEFEF);
const kDarkPink1 = Color(0xFFb00f65);
const kDarkPink2 = Color(0xFFa1105d);
const kDarkPink3 = Color(0xFF940f56);
const kDarkPink4 = Color(0xFF880E4F);

const double kDefaultPadding = 20.0;

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

List<BoxShadow> customShadowSmall = [
  BoxShadow(
    color: Colors.blue[800].withOpacity(0.2),
    blurRadius: 2,
    offset: new Offset(0.0, 3.0),
  ),
];

Widget homeTitle(String title, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Hi " + title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
      ),
      SizedBox(height: 4),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}

Widget appBarTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: kPrimaryColor,
    ),
  );
}

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

List pieColors = [kScaffoldBackgroundColor2, kCompletedColor];

const pinkGradient = LinearGradient(
  colors: <Color>[kDarkPink4, kDarkPink2, kDarkPink1],
  stops: [0.0, 0.5, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
