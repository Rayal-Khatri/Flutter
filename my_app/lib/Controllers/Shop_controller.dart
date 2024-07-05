// import 'package:get/get.dart';
// import 'package:my_app/Data/Repository/Shop_repo.dart';
// import 'package:my_app/Models/Shop_model.dart';

// class ShopController extends GetxController {
//   final ShopRepo shopRepo;
//   ShopController({required this.shopRepo});

//   List<dynamic> _shopList = [];
//   List<dynamic> get shopList => _shopList;

//   bool _isLoaded = false;
//   bool get isLoaded => _isLoaded;

//   Future<void> getShelterList() async {
//     Response response = await shopRepo.getShopList();
//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseBody = response.body as Map<String, dynamic>;
//       Shops shop = Shops.fromJson(responseBody);
//       _shopList = shop.shop ?? []; // Ensure it's not null
//       _isLoaded = true;
//       update();
//     } else {
//       print("Getting ShopFailed!");
//     }
//   }
// }
