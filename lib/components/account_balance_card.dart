import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class AccountBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Selected Plan".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: customShadow,
                      color: kScaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: customShadow,
                      color: kScaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (cntext, i) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: kScaffoldBackgroundColor,
                  boxShadow: customShadow,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: -40,
                      bottom: 10,
                      left: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 10,
                      bottom: 20,
                      left: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 60,
                      top: 40,
                      bottom: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 55,
                      top: 65,
                      bottom: 38,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 55,
                      top: 85,
                      bottom: 44,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 55,
                      top: 100,
                      bottom: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: customShadow,
                          shape: BoxShape.circle,
                          color: kScaffoldBackgroundColor.withAlpha(225),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: AccountDetails(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
