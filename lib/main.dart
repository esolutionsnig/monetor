import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moneytor/Screens/wrapper.dart';
import 'package:moneytor/components/constants.dart';
import 'package:moneytor/models/user_model.dart';
import 'package:moneytor/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moneytor',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          // canvasColor: Colors.transparent,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          dividerTheme: DividerThemeData(
            space: 6,
            thickness: 2,
            color: kSecondaryColor,
            indent: 2.5,
            endIndent: 2.5,
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
