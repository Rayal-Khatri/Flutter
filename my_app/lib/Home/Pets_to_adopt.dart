import 'package:flutter/material.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Widgets/Big_texts.dart';
import 'package:my_app/Widgets/Icon_Text.dart';
import 'package:my_app/Widgets/Small_texts.dart';

class PetAdoptChoices extends StatefulWidget {
  const PetAdoptChoices({Key? key}) : super(key: key);

  @override
  State<PetAdoptChoices> createState() => _PetAdoptChoicesState();
}

class _PetAdoptChoicesState extends State<PetAdoptChoices> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  @override
  void initstate() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 280,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
    }

    return Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            height: 230,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Images/shelther1.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 110,
              margin: EdgeInsets.only(left: 17, right: 17, bottom: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(children: [
                  BigText(text: "Shena's Care"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.stars,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      SmallText(text: "4.5"),
                      SmallText(text: "123 Reviews"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ]),
              ),
            ),
          )
        ]));
  }
}
