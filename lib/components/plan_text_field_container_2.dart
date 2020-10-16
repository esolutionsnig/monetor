import 'package:flutter/material.dart';

class PlanTextFieldContainer2 extends StatelessWidget {
  final Widget child;
  final double width;
  const PlanTextFieldContainer2({
    Key key,
    this.child,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
