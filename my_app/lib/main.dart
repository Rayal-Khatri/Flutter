import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controllers/Popular_product_controller.dart';
import 'package:my_app/Controllers/Popular_Items_controller.dart';
import 'package:my_app/Controllers/Shelter_controller.dart';
import 'package:my_app/Pages/Home/home_pets.dart';
import 'package:my_app/Pages/Shelters/Adoption_Pet_Details.dart';
import 'package:my_app/Pages/Symptoms/Symptom_Analysis.dart';
import 'Helper/Dependencies.dart' as dep;
import 'Routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("i was called");
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.This is testing
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<ShelterController>().getShelterList();

    // Get.find<PopularProductController>().getPopularItemList();
    // Get.find<ShelterController>().getShelterList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Pet',
      home: MainPetPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
    //AdoptionPetDetails
    //SymptomAnalysis
    //MainPetPage
  }
}
