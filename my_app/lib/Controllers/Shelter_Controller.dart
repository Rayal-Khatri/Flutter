import 'package:get/get.dart';
import 'package:my_app/Data/Repository/Shelter_repo.dart';
import 'package:my_app/Models/Shelter_model.dart';

class ShelterController extends GetxController {
  final ShelterRepo shelterRepo;
  ShelterController({required this.shelterRepo});

  List<dynamic> _shelterList = [];
  List<dynamic> get shelterList => _shelterList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getShelterList() async {
    Response response = await shelterRepo.getShelterList();
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = response.body as Map<String, dynamic>;
      Shelters_adopt shelthers = Shelters_adopt.fromJson(responseBody);
      _shelterList = shelthers.shelter ?? []; // Ensure it's not null
      _isLoaded = true;
      update();
    } else {
      print("Getting Shelther Failed!");
    }
  }
}
