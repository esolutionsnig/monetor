import 'package:flutter/material.dart';
import 'package:moneytor/components/components.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              color: kSecondaryLightColor,
              boxShadow: customShadowSmall,
              shape: BoxShape.circle),
        ),
        SizedBox(width: 12),
        Column(
          children: [
            Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: kSecondaryLightColor,
                boxShadow: customShadowSmall,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 20,
              width: 200,
              decoration: BoxDecoration(
                color: kSecondaryLightColor,
                boxShadow: customShadowSmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
