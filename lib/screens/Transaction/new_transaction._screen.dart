import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/components/loading.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/services/database.dart';
import 'package:provider/provider.dart';

class NewTransactionScreen extends StatefulWidget {
  @override
  _NewTransactionScreenState createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: paymentDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != paymentDate)
      setState(() {
        paymentDate = picked;
      });
  }

  String title = '';
  String subTitle = '';
  String paymentType = 'Daily';
  int paymentDuration = 0;
  int targetAmount = 0;
  int raisedAmount = 0;
  int proposedRepaymentAmount = 0;
  String status = 'Running';
  DateTime paymentDate = DateTime.now();
  DateTime startDateTime = DateTime.now();
  int progress = 0;

  int _currentIndex = 1;
  String error = "";
  String paymentTypeError = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final numberFormat = NumberFormat("##,###", "en_US");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, 0);
          },
          child: Icon(
            Icons.keyboard_backspace,
            color: kPrimaryColor,
          ),
        ),
        title: appBarTitle("New Plan"),
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: loading
              ? Loading()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Kindly note that all fields are required.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          PlanInputField(
                            textCapitalization: TextCapitalization.sentences,
                            textInputFormatter: [
                              LengthLimitingTextInputFormatter(60),
                            ],
                            hinText: "Title (Maximum of 60 Characters)",
                            validator: (value) =>
                                value.isEmpty ? "Enter the plan title" : null,
                            onChanged: (value) {
                              setState(() {
                                title = value;
                              });
                            },
                          ),
                          PlanInputField(
                            minLines: 3,
                            maxLength: 150,
                            textCapitalization: TextCapitalization.sentences,
                            textInputFormatter: [
                              LengthLimitingTextInputFormatter(150),
                            ],
                            hinText: "Description",
                            validator: (value) => value.isEmpty
                                ? "Enter the plan brief description"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                subTitle = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Select Your Prefered Plan below"),
                                  Text(
                                    paymentTypeError,
                                    style: TextStyle(color: kErrorColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PlanSelector(
                                    press: () {
                                      setState(() {
                                        _currentIndex = 1;
                                        paymentType = "Daily";
                                      });
                                    },
                                    title: "Daily",
                                    icon: Icons.calendar_today,
                                    color: _currentIndex == 1
                                        ? kPrimaryColor
                                        : kTextColor,
                                    backgroundColor: _currentIndex == 1
                                        ? kSecondaryColor
                                        : Colors.grey[200],
                                  ),
                                  PlanSelector(
                                    press: () {
                                      setState(() {
                                        _currentIndex = 2;
                                        paymentType = "Weekly";
                                      });
                                    },
                                    title: "Weekly",
                                    icon: Icons.calendar_today_rounded,
                                    color: _currentIndex == 2
                                        ? kPrimaryColor
                                        : kTextColor,
                                    backgroundColor: _currentIndex == 2
                                        ? kSecondaryColor
                                        : Colors.grey[200],
                                  ),
                                  PlanSelector(
                                    press: () {
                                      setState(() {
                                        _currentIndex = 3;
                                        paymentType = "Monthly";
                                      });
                                    },
                                    title: "Monthly",
                                    icon: Icons.calendar_today_outlined,
                                    color: _currentIndex == 3
                                        ? kPrimaryColor
                                        : kTextColor,
                                    backgroundColor: _currentIndex == 3
                                        ? kSecondaryColor
                                        : Colors.grey[200],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "You have to enter Duration (number of chosen plan type) then enter target amount to generate proposed payment plan"),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  DurationInputField(
                                    textCapitalization: TextCapitalization.none,
                                    hinText: "Duration",
                                    textInputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    validator: (value) =>
                                        value.isEmpty ? "Required" : null,
                                    onChanged: (value) {
                                      setState(() {
                                        paymentDuration = int.parse(value);
                                      });
                                    },
                                  ),
                                  SizedBox(width: 20),
                                  AmountInputField(
                                    textCapitalization: TextCapitalization.none,
                                    hinText: "Target Amount",
                                    keyboardType: TextInputType.number,
                                    textInputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) => value.isEmpty
                                        ? "Amount is required"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        targetAmount = int.parse(value);
                                        proposedRepaymentAmount =
                                            (targetAmount / paymentDuration)
                                                .round();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Traget Amount",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "${numberFormat.format(targetAmount)}",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Proposed Payment Per $paymentType",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "${numberFormat.format(proposedRepaymentAmount)}",
                                        style: TextStyle(fontSize: 26),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Select Reoccuring Payment Date Below:"),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  PlanSelector(
                                    title: "Set Prefered Date",
                                    icon: Icons.calendar_today,
                                    backgroundColor: kSecondaryLightColor,
                                    color: kTextColor,
                                    press: () => _selectDate(context),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "${paymentDate.toLocal()}".split(' ')[0],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          RoundedButton(
                            text: "Save Plan",
                            color: kSecondaryColor,
                            textColor: kPrimaryColor,
                            press: () async {
                              if (paymentType == '') {
                                setState(() {
                                  paymentTypeError = 'Required';
                                });
                              } else {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });

                                  // Add Plan
                                  await DatabaseService().addPlan(
                                      user.uid,
                                      title,
                                      subTitle,
                                      paymentType,
                                      paymentDuration,
                                      targetAmount,
                                      raisedAmount,
                                      proposedRepaymentAmount,
                                      status,
                                      paymentDate,
                                      startDateTime,
                                      progress);
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
