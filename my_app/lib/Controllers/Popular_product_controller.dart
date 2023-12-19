import 'package:get/get.dart';
import 'package:my_app/Data/Repository/Popular_Pet_repo.dart';
import 'package:my_app/Models/Pet_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = response.body as Map<String, dynamic>;
      Adoption adoption = Adoption.fromJson(responseBody);
      _popularProductList = adoption.dogs ?? []; // Ensure it's not null
      _isLoaded = true;
      update();
    } else {
      print("Failed!");
    }
  }
}
