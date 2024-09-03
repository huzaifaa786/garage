import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class VerifyNumberApi {
  static Future<Map<String, dynamic>> verifyNumber({
    String? phone,
  }) async {
    //* URL
    String url = '$baseUrl/login/phone/verify';
    
    var data = {
      'phone': phone,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
