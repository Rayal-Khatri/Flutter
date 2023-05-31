import 'package:flutter/material.dart';
import 'package:my_app/Widgets/Small_texts.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 10,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
