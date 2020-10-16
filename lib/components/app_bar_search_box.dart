import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class AppBarSearchBox extends StatelessWidget {
  final Function press;
  final String searchText;
  final ValueChanged<String> onChanged;
  const AppBarSearchBox({
    Key key,
    this.press,
    this.searchText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: searchText,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            child: Icon(
              Icons.search,
              size: 30,
              color: kSecondaryColor,
            ),
            onTap: press,
          ),
        ],
      ),
    );
  }
}
