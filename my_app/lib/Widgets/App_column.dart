import 'package:flutter/material.dart';

import '../Utils/Colors.dart';
import '../Utils/dimentions.dart';
import 'Big_texts.dart';
import 'Icon_Text.dart';
import 'Small_texts.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.TextSize26,
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.stars,
                      color: AppColors.mainColor,
                      size: Dimensions.height15,
                    )),
          ),
          SizedBox(
            width: Dimensions.height10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: Dimensions.height10,
          ),
          SmallText(text: "123 Reviews"),
        ],
      ),
      SizedBox(height: Dimensions.height20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndText(
              icon: Icons.circle_sharp,
              text: " Normal",
              iconColor: AppColors.iconColor1),
          IconAndText(
              icon: Icons.gps_fixed_sharp,
              text: " 2.1Km",
              iconColor: AppColors.mainColor),
          IconAndText(
              icon: Icons.access_alarm_rounded,
              text: " 3.2 mins",
              iconColor: AppColors.iconColor2),
        ],
      )
    ]);
  }
}
