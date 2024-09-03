import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GetVechileApi {
  static Future<Map<String, dynamic>> getVechiles() async {
    String url = '$baseUrl/vehicletype';
    var response = await DioService.get(url: url,);
    return response;
  }
}
