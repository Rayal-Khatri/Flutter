import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Pages/Home/Pets_to_adopt.dart';
import 'package:my_app/Pages/Home/home.dart';
import 'package:my_app/Pages/Shelthers/Adoption_Pet_Details.dart';
import 'Helper/Dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.This is testing
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Passenger Counter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainPetPage());
    //AdoptionPetDetails
    //MainPetPage
  }
}
