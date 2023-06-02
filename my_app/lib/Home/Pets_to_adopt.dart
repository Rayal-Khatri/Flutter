import 'package:flutter/material.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Utils/dimentions.dart';
import 'package:my_app/Widgets/Big_texts.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
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
    return Column(
      children: [
        Container(
          // color: Colors.red,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
        transform: matrix,
        child: Stack(children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.height10, right: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Images/shelther1.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.height30,
                  right: Dimensions.height30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height10,
                    right: Dimensions.height10),
                child: Column(children: [
                  BigText(text: "Shena's Care"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      SmallText(text: "4.5"),
                      SmallText(text: "123 Reviews"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
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
