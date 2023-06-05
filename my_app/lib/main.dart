import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Pages/Shelthers/Adoption_Pet_Details.dart';
import 'package:my_app/Pages/Shelthers/Popular_Shelthers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Passenger Counter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AdoptionPetDetails());
  }
}
