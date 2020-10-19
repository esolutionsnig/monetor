import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/components/loading.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Transaction/add_fund_screen.dart';
import 'package:moneytor/screens/Transaction/components/payment_list.dart';
import 'package:moneytor/screens/Transaction/components/transaction_card.dart';
import 'package:moneytor/screens/Transaction/components/transaction_chart.dart';
import 'package:moneytor/services/database.dart';
import 'package:provider/provider.dart';

class TransactionDetail extends StatefulWidget {
  final PlanModel plan;
  TransactionDetail({Key key, this.plan}) : super(key: key);
  @override
  _TransactionDetailState createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  bool isGoingDown = true;

  Color backgroundColor;
  @override
  Widget build(BuildContext context) {
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
        title: appBarTitle("Moneytor Plan"),
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
      body: NotificationListener<ScrollNotification>(
        onNotification: (onScrollNotification) {
          if (onScrollNotification is ScrollUpdateNotification) {
            if (onScrollNotification.scrollDelta <= 0.0) {
              if (!isGoingDown) setState(() => isGoingDown = true);
            } else {
              if (isGoingDown) setState(() => isGoingDown = false);
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          child: StreamBuilder<PlanModel>(
            stream: DatabaseService(reqId: widget.plan.id).getPlan,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                PlanModel planModel = snapshot.data;
                if (planModel.status == 'Completed') {
                  backgroundColor = kCompletedColor;
                } else {
                  backgroundColor = kHalfwayColor;
                }
                // List for pieChart
                int ta = planModel.targetAmount - planModel.raisedAmount;
                List planData = [
                  {
                    "amount": ta,
                  },
                  {
                    "amount": planModel.raisedAmount,
                  }
                ];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            planModel.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      TransactionCard(
                        plan: planModel,
                        backgroundColor: backgroundColor,
                      ),
                      SizedBox(height: 30),
                      TransactionChart(
                        targetTitle: "Target",
                        targetColor: kPrimaryColor,
                        targetAmount: planModel.targetAmount,
                        completedTitle: "Completed",
                        completedColor: kCompletedColor,
                        completedAmount: planModel.raisedAmount,
                        planData: planData,
                        perc: planModel.progress,
                      ),
                      SizedBox(height: 20),
                      StreamProvider<List<PaymentModel>>.value(
                        value: DatabaseService().planPaymentData(planModel.id),
                        child: Container(
                          child: PaymentList(),
                          height: 500,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Loading();
              }
            },
          ),
        ),
      ),
      floatingActionButton: AppFabButton(
        isExtended: isGoingDown,
        title: "Add Fund",
        icon: Icons.account_balance_wallet_outlined,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddFundScreen(
                  plan: widget.plan,
                  raisedAmount: widget.plan.raisedAmount,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
