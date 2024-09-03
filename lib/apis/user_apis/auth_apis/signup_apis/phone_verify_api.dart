import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class phoneOtpApi {
  static Future<Map<String, dynamic>> registerUserWithOtp({
    String? phone,
  }) async {
    //* URL
    String url = '${baseUrl}/phone/verification';
    
    var data = {
      'phone': phone,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
