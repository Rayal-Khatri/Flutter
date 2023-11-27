import 'package:my_app/Controllers/Popular_produ%20t_controller.dart';
import 'package:my_app/Data/API/API_Client.dart';
import 'package:get/get.dart';
import 'package:my_app/Data/Repository/Popular_Pet_repo.dart';

Future<void> init() async {
  //api clients
  Get.lazyPut(() => ApiClient(appBaseURL: "https://www.dbstech.com"));
  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
