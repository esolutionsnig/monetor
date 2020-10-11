import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/screens/authenticate/sign_up_screen.dart';
import 'package:moneytor/services/auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In".toUpperCase(),
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/mp.png",
                      height: size.height * 0.35,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RoundedInputField(
                          hinText: "Your Email Address",
                          icon: Icons.person,
                          validator: (value) =>
                              value.isEmpty ? "Enter an emaill address" : null,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        RoundedPasswordField(
                          hinText: "Password",
                          icon: Icons.lock,
                          suffxIcon: Icons.visibility,
                          validator: (value) =>
                              value.isEmpty ? "Enter a valid password" : null,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        RoundedButton(
                          text: "Sign Me In",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              // Sign In User
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = "Please supply valid credential";
                                });
                              }
                            }
                          },
                          color: kSecondaryColor,
                          textColor: kPrimaryColor,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  AlreadyHaveAccount(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
