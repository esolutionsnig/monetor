import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class TransactionChart extends StatelessWidget {
  final String targetTitle;
  final Color targetColor;
  final int targetAmount;
  final String completedTitle;
  final Color completedColor;
  final int completedAmount;
  final List planData;
  final int perc;

  TransactionChart({
    this.targetTitle,
    this.targetColor,
    this.targetAmount,
    this.completedTitle,
    this.completedColor,
    this.completedAmount,
    this.planData,
    this.perc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction Chart".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChartLabel(
                  icon: Icons.circle,
                  iconColor: targetColor,
                  title: targetTitle,
                ),
                ChartLabel(
                  icon: Icons.circle,
                  iconColor: completedColor,
                  title: completedTitle,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: customShadowSmall,
              color: kScaffoldBackgroundColor,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomPaint(
                    foregroundPainter: PieChartPainter(
                      targetAmount,
                      completedAmount,
                      planData,
                    ),
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: customShadow,
                      color: kScaffoldBackgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$perc",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "%",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final int target;
  final int completed;
  final List planData;
  PieChartPainter(this.target, this.completed, this.planData);

  @override
  void paint(Canvas canvas, Size size) {
    // Set center and radis
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    double total = 0;

    // Get total value of the transactions
    planData.forEach((element) {
      total += element['amount'];
    });

    // Set start radia (Where to start)
    var startRadian = -pi / 2;

    for (int i = 0; i < planData.length; i++) {
      var currentTransaction = planData[i];
      var sweepRadian = (currentTransaction['amount'] / total) * 2 * pi;
      paint.color = pieColors[i];

      // Draw Arc
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
