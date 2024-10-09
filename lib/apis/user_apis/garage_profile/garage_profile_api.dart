import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GarageProfileApi {
  static Future<Map<String, dynamic>> garageProfile(id) async {
    String url = '$baseUrl/garage/profile';
    var data = {'garage_id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
