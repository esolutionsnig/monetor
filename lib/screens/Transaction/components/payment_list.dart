import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Transaction/components/payment_tile.dart';
import 'package:provider/provider.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("##,###", "en_US");
    final payments = Provider.of<List<PaymentModel>>(context) ?? [];
    // print(payments.length);
    if (payments.length > 0) {
      var reversedList = new List.from(payments.reversed);
      return Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Payments: ".toUpperCase() +
                      "${numberFormat.format(payments.length)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reversedList.length,
              itemBuilder: (context, index) {
                return PaymentTile(payment: reversedList[index]);
              },
            ),
          ),
        ],
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Awaiting your first payment."),
          ],
        ),
      );
    }
  }
}
