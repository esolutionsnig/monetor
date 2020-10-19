import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:moneytor/Screens/Dashboard/components/recent_transaction_list.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/models/profile_model.dart';
import 'package:moneytor/screens/Dashboard/components/header.dart';
import 'package:moneytor/screens/Dashboard/components/plan_list.dart';
import 'package:moneytor/screens/Dashboard/search_screen.dart';
import 'package:moneytor/screens/Transaction/new_transaction._screen.dart';
import 'package:moneytor/services/auth.dart';
import 'package:moneytor/services/database.dart';
import 'package:provider/provider.dart';

import 'components/profile_shimmer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AuthService _auth = AuthService();

  int currentIndex = 0;
  String searchData = '';

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;

    final user = Provider.of<UserModel>(context);

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: MultiProvider(
        providers: [
          StreamProvider<UserModel>.value(value: AuthService().user),
          StreamProvider<List<PlanModel>>.value(
            value: DatabaseService().userPlanData(user.uid),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Text(""),
            title: AppBarSearchBox(
              searchText: "Enter plan title to search...",
              onChanged: (value) {
                setState(() {
                  searchData = value;
                });
              },
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchScreen(title: searchData);
                    },
                  ),
                );
              },
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[kDarkPink4, kDarkPink2, kDarkPink1],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<ProfileModel>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ProfileModel profileModel = snapshot.data;
                      return HomeHeader(
                        size: size,
                        name: profileModel.name.length > 19
                            ? profileModel.name.substring(0, 20)
                            : profileModel.name,
                        subtitle: "Welcome",
                        icon: profileModel.gender == "Male"
                            ? Icons.person
                            : profileModel.gender == "Female"
                                ? Icons.pregnant_woman_outlined
                                : Icons.ac_unit,
                      );
                    } else {
                      return ProfileShimmer();
                    }
                  },
                ),
                SizedBox(height: 30),
                Container(
                  height: 260,
                  child: PlanList(),
                ),
                SizedBox(height: 5),
                StreamProvider<List<PaymentModel>>.value(
                  value: DatabaseService().payments,
                  child: Container(
                    child: RecentTransactionList(),
                    height: 500,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: currentIndex,
            showElevation: true,
            itemCornerRadius: 50,
            curve: Curves.easeInBack,
            onItemSelected: (index) {
              setState(() {
                currentIndex = index;
              });
              if (currentIndex == 2) {
                // Warn user about sign out request
                animated_dialog_box.showScaleAlertBox(
                  context: context,
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Out request".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  icon: Icon(
                    Icons.recent_actors_outlined,
                    size: 60,
                    color: kErrorColor,
                  ),
                  yourWidget: Container(
                    child: Text(
                        "You have initiated a sign out request, kindly confirm you want to sign out of the Moneytor App."),
                  ),
                  firstButton: RoundedModalButton(
                    text: "Cancel",
                    press: () {
                      setState(() {
                        currentIndex = 0;
                      });
                      Navigator.of(context).pop();
                    },
                    color: kSecondaryColor,
                    textColor: kPrimaryColor,
                  ),
                  secondButton: RoundedModalButton(
                    text: "Yes, Sign Me Out",
                    press: () async {
                      Navigator.of(context).pop();
                      await _auth.signOut();
                    },
                    color: kPrimaryColor,
                    textColor: kErrorColor,
                  ),
                );
              } else if (currentIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewTransactionScreen();
                    },
                  ),
                ).then((value) {
                  setState(() {
                    currentIndex = 0;
                  });
                });
              } else {
                //
              }
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text("Dashboard"),
                activeColor: kSecondaryColor,
                inactiveColor: kTextColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.add_circle_outline_rounded, size: 30),
                title: Text('New Plan'),
                activeColor: kSecondaryColor,
                inactiveColor: kTextColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.logout),
                title: Text('Sign Out'),
                activeColor: kSecondaryColor,
                inactiveColor: kTextColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
