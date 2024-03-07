import 'package:get/get.dart';
import 'package:my_app/Data/API/API_Client.dart';
import 'package:my_app/Utils/appConstants.dart';

class ShopRepo extends GetxService {
  final ApiClient apiClient;
  ShopRepo({required this.apiClient});

  Future<Response> getShopList() async {
    return await apiClient.getData(AppConstants.SHOP_URL);
  }
}
