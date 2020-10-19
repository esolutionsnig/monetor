import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/components/loading.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/dashboard_screen.dart';
import 'package:moneytor/services/database.dart';

class AddFundScreen extends StatefulWidget {
  final PlanModel plan;
  final int raisedAmount;
  AddFundScreen({Key key, this.plan, this.raisedAmount}) : super(key: key);
  @override
  _AddFundScreenState createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> payamentModeList = [
    "Banking Hall",
    "Bank Transfer",
    "Online Transfer (Bank)",
    "Online Transfer (3rd Party)",
    "Paid Cash",
    "Wire Transfer",
    "USSD Code Transfer",
    "Others",
  ];

  bool isGoingDown = true;
  int _currentIndex = 0;
  int amount = 0;
  DateTime paymentDate = DateTime.now();
  String paymentMode = "";
  String paymentChannel = "";
  String transactionReference = "";
  bool loading = false;
  String error = "";

  String planId = "";
  int raisedAmount = 0;
  int progress = 0;
  int remainingAmount = 0;
  String status = "";

  Color backgroundColor;

  @override
  void initState() {
    super.initState();
    amount = widget.plan.proposedRepaymentAmount;
    raisedAmount = widget.raisedAmount;
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('##,###', 'en_US');

    remainingAmount = widget.plan.targetAmount - widget.plan.raisedAmount;

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
        title: appBarTitle("Fund Your Plan"),
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: loading
              ? Loading()
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To hit your target, you need to raise:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "${numberFormat.format(remainingAmount)}",
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20),
                      PlanInputField(
                        hinText: "Transaction Institution",
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) => value.isEmpty
                            ? "Enter a payment chennel / institution"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            paymentChannel = value;
                          });
                        },
                      ),
                      SizedBox(height: 6),
                      PlanInputField(
                        hinText: "Transaction Reference Number",
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) {
                          setState(() {
                            transactionReference = value;
                          });
                        },
                      ),
                      SizedBox(height: 6),
                      PlanTextFieldContainer(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: "Payment Mode",
                            border: InputBorder.none,
                          ),
                          validator: (value) =>
                              value.isEmpty ? "Payment mode is required" : null,
                          items: payamentModeList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              paymentMode = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FundOptionButton(
                            title: "Paid a Token",
                            background: _currentIndex == 0
                                ? kSecondaryColor
                                : kGreyColor,
                            color:
                                _currentIndex == 0 ? kPrimaryColor : kTextColor,
                            press: () {
                              setState(() {
                                _currentIndex = 0;
                                amount = widget.plan.proposedRepaymentAmount;
                              });
                            },
                          ),
                          FundOptionButton(
                            title: "Liquidated",
                            background: _currentIndex == 1
                                ? kSecondaryColor
                                : kGreyColor,
                            color:
                                _currentIndex == 1 ? kPrimaryColor : kTextColor,
                            press: () {
                              var balance = widget.plan.targetAmount -
                                  widget.plan.raisedAmount;
                              setState(() {
                                _currentIndex = 1;
                                amount = balance;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "You have chosen to pay a sum of: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${numberFormat.format(amount)}",
                        style: TextStyle(
                          color: kCompletedColor,
                          fontSize: 70,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                          "Note that this is strictly for record keeping. You are expected to have funded the actual account before proceeding with the save button."),
                      SizedBox(height: 30),
                      RoundedButton(
                        text: "Save Paid Amount",
                        color: kSecondaryColor,
                        textColor: kPrimaryColor,
                        press: () async {
                          print(widget.plan.raisedAmount);
                          print("object");
                          if (_formKey.currentState.validate()) {
                            // Add Payment
                            dynamic result = await DatabaseService().addPayment(
                              widget.plan.id,
                              widget.plan.title,
                              amount,
                              paymentDate,
                              raisedAmount,
                              widget.plan.targetAmount,
                              paymentMode,
                              paymentChannel,
                              transactionReference,
                            );
                            if (result == null) {
                              setState(() {
                                error = "Transaction failed";
                                loading = false;
                              });
                            } else {
                              // Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DashboardScreen();
                                  },
                                ),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: kErrorColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class FundOptionButton extends StatelessWidget {
  final String title;
  final Function press;
  final Color background, color;
  const FundOptionButton({
    Key key,
    this.title,
    this.press,
    this.background,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: 155,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(30),
          boxShadow: customShadowSmall,
        ),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: color,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
