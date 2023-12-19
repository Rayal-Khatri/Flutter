import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/Pages/Home/home.dart';
import 'package:my_app/Routes/route_helper.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Utils/dimentions.dart';
import 'package:my_app/Widgets/App_column.dart';
import 'package:my_app/Widgets/App_icon.dart';
import 'package:my_app/Widgets/Expandable_text.dart';
import '../../Widgets/Big_texts.dart';

class PopularShelter extends StatelessWidget {
  const PopularShelter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Icons
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.ImgHeightStatic,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/Images/Shelther1.jpg'))),
            ),
          ),
          //Icon Widget
          Positioned(
            top: Dimensions.height30,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios_new)),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),
          //Introduction
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.ImgHeightStatic - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.height20,
                  right: Dimensions.height20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Shena's Care",
                  ),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduction"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "Sneha’s Care operates one of the largest dog shelters of Nepal where currently around 140 dogs are housed. The Dogs of Kathmandu are often subjected to the most horrific cruelty. They are beaten, kicked, and hit-and-run by vehicles, making them injured, in pain, or starving.\n\n Sneha’s Care receives almost 40/50 animal cruelty and abuse cases mostly related to street dogs by hotline, email, and social media. We have a well-equipped team consisting of veterinary doctors, assistants, and helpers who handle the cases by visiting the spot where the incident takes place.  Our team is always on the move in our animal ambulance where the full-fledged medical facility has been installed to transfer the animals to our clinic during serious cases. We try to handle almost all the received cases by our means and sometimes locals and other volunteers also support in rescue and medication. After analyzing the spot animal situation our team decides what should be done and where. In most cases where the injuries are minor, we medicate the animals on the spot and release them in the same spot but in serious cases, we transfer them to our clinic and also in our shelter for long-term recovery.")))
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.BottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.height20,
            right: Dimensions.height20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.height20),
                topRight: Radius.circular(Dimensions.height20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.height10,
                  right: Dimensions.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.height5),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.height5),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.height20,
                right: Dimensions.height20,
              ),
              child: BigText(
                text: "Fill Adoption Form",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
