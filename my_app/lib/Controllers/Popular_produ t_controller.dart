import 'package:get/get.dart';
import 'package:my_app/Data/Repository/Popular_Pet_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response responce = await popularProductRepo.getPopularProductList();
    if (responce.statusCode == 200) {
      _popularProductList = [];
      // _popularProductList.addAll()
      update();
    } else {}
  }
}
