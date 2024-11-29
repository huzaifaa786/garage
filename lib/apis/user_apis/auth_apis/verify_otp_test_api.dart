import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class VerifyOtpTestApi {
  static Future<Map<String, dynamic>> verifyNumber({
    String? phone,
    String? otp,

  }) async {
        // final token = await FirebaseMessaging.instance.getToken();

    //* URL
    String url = '$baseUrl/verifyOtp';

    var data = {
      'phone': phone,
      'otp': otp,
      // 'fcm_token': token,

    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
