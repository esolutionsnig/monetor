import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/components/loading.dart';
import 'package:moneytor/screens/authenticate/sign_in_screen.dart';
import 'package:moneytor/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String name = "";
  String gender = "";
  String email = "";
  String password = "";
  String error = "";

  int _currentIndex = 0;

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
                  "assets/images/signup_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              loading
                  ? Loading()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Free Account".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/mp.png",
                            height: size.height * 0.15,
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
                                hinText: "Your Display Name",
                                icon: Icons.person,
                                validator: (value) => value.isEmpty
                                    ? "Enter your display name"
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                              ),
                              Column(
                                children: [
                                  Text("Select Your Gender below"),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GenderSelector(
                                          press: () {
                                            setState(() {
                                              _currentIndex = 1;
                                              gender = "Male";
                                            });
                                          },
                                          title: "Male",
                                          icon: Icons.person_outline,
                                          color: _currentIndex == 1
                                              ? kPrimaryColor
                                              : kTextColor,
                                          backgroundColor: _currentIndex == 1
                                              ? kSecondaryColor
                                              : Colors.grey[200],
                                        ),
                                        GenderSelector(
                                          press: () {
                                            setState(() {
                                              _currentIndex = 2;
                                              gender = "Female";
                                            });
                                          },
                                          title: "Female",
                                          icon: Icons.pregnant_woman_outlined,
                                          color: _currentIndex == 2
                                              ? kPrimaryColor
                                              : kTextColor,
                                          backgroundColor: _currentIndex == 2
                                              ? kSecondaryColor
                                              : Colors.grey[200],
                                        ),
                                        GenderSelector(
                                          press: () {
                                            setState(() {
                                              _currentIndex = 3;
                                              gender = "Others";
                                            });
                                          },
                                          title: "Others",
                                          icon: Icons.ac_unit_outlined,
                                          color: _currentIndex == 3
                                              ? kPrimaryColor
                                              : kTextColor,
                                          backgroundColor: _currentIndex == 3
                                              ? kSecondaryColor
                                              : Colors.grey[200],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              RoundedInputField(
                                hinText: "Your Email Address",
                                icon: Icons.email,
                                validator: (value) => value.isEmpty
                                    ? "Enter an emaill address"
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: buildPAsswordTextField("Password"),
                              ),
                              RoundedButton(
                                text: "Sign Me Up",
                                press: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    // Register User
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            name, gender, email, password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            "Please supply valid information";
                                        loading = false;
                                      });
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  }
                                },
                                color: kSecondaryColor,
                                textColor: kPrimaryColor,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        AlreadyHaveAccount(
                          login: false,
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
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPAsswordTextField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: kSecondaryColor,
        ),
        suffixIcon: IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden
              ? Icon(
                  Icons.visibility_off,
                  color: kSecondaryColor,
                )
              : Icon(
                  Icons.visibility,
                  color: kSecondaryColor,
                ),
        ),
      ),
      obscureText: _isHidden,
      validator: (value) => value.isEmpty ? "Enter a valid password" : null,
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
    );
  }
}
