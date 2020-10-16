import 'package:flutter/material.dart';

class RoundedModalButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedModalButton(
      {Key key, this.text, this.press, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
