import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';

class PaymentTile extends StatelessWidget {
  final PaymentModel payment;
  PaymentTile({
    Key key,
    this.payment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat("##,###", "en_US");
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        boxShadow: customShadowSmall,
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payment.paymentMode,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    "+",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: kCompletedColor,
                    ),
                  ),
                  Text(
                    "${numberFormat.format(payment.amount)}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: kCompletedColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            payment.paymentChannel,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 3),
          Text(
            payment.transactionReference,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "${payment.paymentDate}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
