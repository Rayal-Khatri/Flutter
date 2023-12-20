import 'package:get/get.dart';
import 'package:my_app/Pages/Home/home.dart';
import 'package:my_app/Pages/Shelters/Popular_Shelthers_page.dart';
import '../Pages/Shelters/Adoption_Pet_Details.dart';

class RouteHelper {
  static const String initial = '/';
  static const String Shelters = "/shelter";
  static const String Dogs = "/Dogs";

  static String getInitial() => '$initial';
  static String getShelter(int pageID) => '$Shelters?pageID=$pageID';
  static String getDogs() => '$Dogs';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainPetPage()),
    GetPage(
        name: Shelters,
        page: () {
          var pageID = Get.parameters['pageID'];
          return PopularShelter(pageID: int.parse(pageID!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: Dogs,
        page: () {
          return AdoptionPetDetails();
        },
        transition: Transition.fadeIn),
  ];
}
