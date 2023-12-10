import 'package:get/get.dart';
import 'package:my_app/Utils/appConstants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseURL;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseURL}) {
    baseUrl = appBaseURL;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response responce = await get(uri);
      return responce;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
