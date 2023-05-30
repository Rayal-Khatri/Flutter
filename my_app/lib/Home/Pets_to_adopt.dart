import 'package:flutter/material.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Widgets/Big_texts.dart';
import 'package:my_app/Widgets/Small_texts.dart';

class PetAdoptChoices extends StatefulWidget {
  const PetAdoptChoices({Key? key}) : super(key: key);

  @override
  State<PetAdoptChoices> createState() => _PetAdoptChoicesState();
}

class _PetAdoptChoicesState extends State<PetAdoptChoices> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        height: 220,
        margin: EdgeInsets.only(left: 5, right: 5),
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
          height: 130,
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(children: [
              BigText(text: "Shena's Care"),
              SizedBox(height: 30),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.yellow,
                        size: 10,
                      ),
                      SmallText(text: "Normal")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 10,
                      ),
                      SmallText(text: "2.1Km")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: AppColors.mainColor,
                        size: 10,
                      ),
                      SmallText(text: "32mins")
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      )
    ]);
  }
}
