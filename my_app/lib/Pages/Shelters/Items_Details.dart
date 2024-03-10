import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controllers/Popular_Items_controller.dart';
import 'package:my_app/Routes/route_helper.dart';
import 'package:my_app/Utils/Colors.dart';
import 'package:my_app/Utils/appConstants.dart';
import 'package:my_app/Utils/dimentions.dart';
import 'package:my_app/Widgets/App_icon.dart';
import 'package:my_app/Widgets/Big_texts.dart';
import 'package:my_app/Widgets/Expandable_text.dart';

class ItemsDetails extends StatelessWidget {
  final int pageID;
  const ItemsDetails({Key? key, required this.pageID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dog = Get.find<PopularItemController>().popularItemList[pageID];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(
                  icon: Icons.catching_pokemon,
                  iconColor: AppColors.mainColor,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10 / 2, bottom: Dimensions.height10),
                child: Center(
                    child:
                        BigText(size: Dimensions.TextSize26, text: dog.name)),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height20),
                    topRight: Radius.circular(Dimensions.height20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.ADOPT_PET_URL + dog.img,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: dog.personality),
                  margin: EdgeInsets.only(
                      left: Dimensions.height20, right: Dimensions.height20),
                ),
              ],
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
                child: AppIcon(
                  icon: Icons.favorite,
                  iconColor: AppColors.mainColor,
                  iconSize: Dimensions.height30,
                )),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.height20,
                right: Dimensions.height20,
              ),
              child: BigText(
                size: 18,
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
