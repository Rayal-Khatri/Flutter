import 'package:get/get.dart';
import 'package:my_app/Data/API/API_Client.dart';
import 'package:my_app/Utils/appConstants.dart';

class PopularItemsRepo extends GetxService {
  final ApiClient apiClient;
  PopularItemsRepo({required this.apiClient});

  Future<Response> getPopularItemList() async {
    return await apiClient.getData(AppConstants.ITEMS_URL);
  }
}
