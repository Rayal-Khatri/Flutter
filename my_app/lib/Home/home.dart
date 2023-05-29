import 'package:flutter/material.dart';
import 'package:my_app/Utils/Colors.dart';
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
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 35, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: AppColors.smokeColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15)),
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
                            size: 12,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                      child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
