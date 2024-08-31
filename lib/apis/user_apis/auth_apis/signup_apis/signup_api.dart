import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class SignupApi {
  static Future<Map<String, dynamic>> registerUser({
    String? name,
    String? phone,
    String? emirate,
    String? addressdetail,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$baseUrl/register/user';
    var data = {
      "name": name,
      "phone": phone,
      "emirate": emirate,
      "address": addressdetail,
      "include":includes,

    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
