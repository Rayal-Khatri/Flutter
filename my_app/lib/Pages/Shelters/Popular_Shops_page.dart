// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:my_app/Controllers/Shelter_controller.dart';
// import 'package:my_app/Routes/route_helper.dart';
// import 'package:my_app/Utils/Colors.dart';
// import 'package:my_app/Utils/appConstants.dart';
// import 'package:my_app/Utils/dimentions.dart';
// import 'package:my_app/Widgets/App_column.dart';
// import 'package:my_app/Widgets/App_icon.dart';
// import 'package:my_app/Widgets/Expandable_text.dart';
// import '../../Widgets/Big_texts.dart';

// class PopularShelter extends StatelessWidget {
//   final int pageID;
//   const PopularShelter({Key? key, required this.pageID}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var shelter = Get.find<ShelterController>().shelterList[pageID];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           //Icons
//           Positioned(
//             left: 0,
//             right: 0,
//             child: Container(
//               width: double.maxFinite,
//               height: Dimensions.ImgHeightStatic,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(AppConstants.BASE_URL +
//                           AppConstants.SHELTER_URL +
//                           shelter.img))),
//             ),
//           ),
//           //Icon Widget
//           Positioned(
//             top: Dimensions.height30,
//             left: Dimensions.height20,
//             right: Dimensions.height20,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Get.toNamed(RouteHelper.getInitial());
//                     },
//                     child: AppIcon(icon: Icons.arrow_back_ios_new)),
//                 AppIcon(icon: Icons.shopping_cart_checkout_outlined),
//               ],
//             ),
//           ),
//           //Introduction
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             top: Dimensions.ImgHeightStatic - 20,
//             child: Container(
//               padding: EdgeInsets.only(
//                   left: Dimensions.height20,
//                   right: Dimensions.height20,
//                   top: Dimensions.height20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(Dimensions.height20),
//                     topRight: Radius.circular(Dimensions.height20)),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppColumn(
//                     text: shelter.name!,
//                   ),
//                   SizedBox(height: Dimensions.height20),
//                   BigText(text: "Introduction"),
//                   SizedBox(height: Dimensions.height20),
//                   Expanded(
//                       child: SingleChildScrollView(
//                           child:
//                               ExpandableTextWidget(text: shelter.description!)))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: Dimensions.BottomHeightBar,
//         padding: EdgeInsets.only(
//             top: Dimensions.height30,
//             bottom: Dimensions.height30,
//             left: Dimensions.height20,
//             right: Dimensions.height20),
//         decoration: BoxDecoration(
//             color: AppColors.buttonBackgroundColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(Dimensions.height20),
//                 topRight: Radius.circular(Dimensions.height20))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                   top: Dimensions.height20,
//                   bottom: Dimensions.height20,
//                   left: Dimensions.height10,
//                   right: Dimensions.height10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Dimensions.height20),
//                   color: Colors.white),
//               child: Row(
//                 children: [
//                   Icon(Icons.remove, color: AppColors.signColor),
//                   SizedBox(width: Dimensions.height5),
//                   BigText(text: "0"),
//                   SizedBox(width: Dimensions.height5),
//                   Icon(
//                     Icons.add,
//                     color: AppColors.signColor,
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 top: Dimensions.height20,
//                 bottom: Dimensions.height20,
//                 left: Dimensions.height20,
//                 right: Dimensions.height20,
//               ),
//               child: BigText(
//                 text: "Fill Adoption Form",
//                 color: Colors.white,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.height20),
//                 color: AppColors.mainColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
