import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class SendOtpApi {
  static Future<Map<String, dynamic>> sendOtp({
    String? phone,
  }) async {

    String url = '$baseUrl/send/otp';

    var data = {
      'phone': phone,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
