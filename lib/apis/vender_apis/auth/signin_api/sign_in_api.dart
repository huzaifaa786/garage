import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VSignInApi {
  static Future<Map<String, dynamic>> login({
    String? email,
    String? password,
  }) async {
        final token = await FirebaseMessaging.instance.getToken();

    String url = '$vbaseUrl/login';
    var data = {
      'email': email,
      'password': password,
      'fcm_token': token,

    };
    var response = await DioService.post(url: url,data: data);
    return response;
  }
}
