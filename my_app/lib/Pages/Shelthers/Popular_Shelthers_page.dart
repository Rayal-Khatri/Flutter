import 'package:flutter/material.dart';
import 'package:my_app/Utils/dimentions.dart';

class PopularShelther extends StatelessWidget {
  const PopularShelther({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.ImgHeightStatic,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/Images/shelther1.jpg'))),
              ))
        ],
      ),
    );
  }
}
