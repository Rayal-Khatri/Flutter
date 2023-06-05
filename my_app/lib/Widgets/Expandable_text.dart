import 'package:flutter/material.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Utils/dimentions.dart';
import 'package:my_app/Widgets/Small_texts.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf; //have to initilized...ie atleast needs to be empty
  late String secondHalf;

  bool hiddentext = true;

  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.5,
              color: AppColors.paraColor,
              size: Dimensions.TextSize16,
              text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.5,
                  color: AppColors.paraColor,
                  size: Dimensions.TextSize16,
                  text: hiddentext
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(text: "Show More", color: AppColors.mainColor),
                      Icon(
                          hiddentext
                              ? Icons.arrow_drop_down
                              : Icons.arrow_upward,
                          color: AppColors.mainColor)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
