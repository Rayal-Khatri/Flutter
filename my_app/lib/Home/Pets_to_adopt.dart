import 'package:flutter/material.dart';

class PetAdoptChoices extends StatefulWidget {
  const PetAdoptChoices({Key? key}) : super(key: key);

  @override
  State<PetAdoptChoices> createState() => _PetAdoptChoicesState();
}

class _PetAdoptChoicesState extends State<PetAdoptChoices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
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
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
          ),
        ),
      )
    ]);
  }
}
