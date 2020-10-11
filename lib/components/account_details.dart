import 'package:flutter/material.dart';
import 'package:moneytor/components/constants.dart';

class AccountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Target Amount:",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "₦",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "250,000,000",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Amount Raised:",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "₦",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "50,000,000",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    boxShadow: customShadow,
                    color: kHalfwayColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      "o".toUpperCase(),
                      style: TextStyle(
                        color: kScaffoldBackgroundColor,
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "On-Going",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "House Rent Progress",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      height: size.height * 0.025,
                      width: size.width * 0.47,
                      decoration: BoxDecoration(
                        boxShadow: customShadow,
                        color: kScaffoldBackgroundColor,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            width: 30,
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "20%",
                      style: TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
