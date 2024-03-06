import 'package:flutter/material.dart';

class SymptomsTitle extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  SymptomsTitle({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? 20 : size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
