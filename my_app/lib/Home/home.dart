import 'package:flutter/material.dart';
import 'package:my_app/Home/Pets_to_adopt.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Utils/dimentions.dart';
import 'package:my_app/Widgets/Big_texts.dart';
import 'package:my_app/Widgets/Small_texts.dart';

class MainPetPage extends StatefulWidget {
  const MainPetPage({super.key});

  @override
  State<MainPetPage> createState() => _MainPetPageState();
}

class _MainPetPageState extends State<MainPetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Location
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.height20, right: Dimensions.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.height15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Nepal",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Lalitpur",
                            color: Colors.black54,
                            size: 8,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                  Center(
                      child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.height24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height15),
                      color: AppColors.mainColor,
                    ),
                  ))
                ],
              ),
            ),
          ),
          //Sliders
          PetAdoptChoices(),
          //Gap
          SizedBox(height: Dimensions.height30),
          //Text
          Container(
            margin: EdgeInsets.only(left: Dimensions.height30),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  BigText(text: "Popular"),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: SmallText(text: "Recommended For You"))
                ]),
          ),
          //List of pets avaliable
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.height20, right: Dimensions.height20),
                );
              }),
        ],
      ),
    );
  }
}
