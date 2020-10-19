import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';
import 'package:moneytor/models/models.dart';
import 'package:moneytor/screens/Dashboard/components/search_result_list.dart';
import 'package:moneytor/services/database.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final String title;
  SearchScreen({Key key, this.title}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchData = '';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PlanModel>>.value(
      value: DatabaseService().searchPlanData(widget.title),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: AppBarSearchBox(
            searchText: "Enter plan title to search...",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen(title: searchData);
                  },
                ),
              );
            },
          ),
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
            height: 800,
            padding: EdgeInsets.only(left: 20, top: 30, bottom: 30),
            child: SearchResultList(),
          ),
        ),
      ),
    );
  }
}
