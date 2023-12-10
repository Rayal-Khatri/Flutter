import 'package:my_app/Controllers/Popular_product_controller.dart';
import 'package:my_app/Data/API/API_Client.dart';
import 'package:get/get.dart';
import 'package:my_app/Data/Repository/Popular_Pet_repo.dart';
import 'package:my_app/Utils/appConstants.dart';

Future<void> init() async {
  //api clients
  Get.lazyPut(() => ApiClient(appBaseURL: AppConstants.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
