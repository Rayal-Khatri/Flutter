import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseURL;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseURL}) {
    baseUrl = appBaseURL;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
}
