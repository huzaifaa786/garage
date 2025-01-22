import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignupApi {
  static Future<Map<String, dynamic>> registerUser({
    String? name,
    String? phone,
    String? emirate,
    String? addressdetail,
    required List<Map<String, dynamic>> includes,
  }) async {
    final token = await FirebaseMessaging.instance.getToken();
    String url = '$baseUrl/register/user';
    var data = {
      "name": name,
      "phone": phone,
      "emirate": emirate,
      "address": addressdetail,
      'fcm_token': token,
      "include": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
   static Future<Map<String, dynamic>> userPhoneNumberCheck({
    String? phone,
  }) async {
    String url = '$baseUrl/phone/check';
    var data = {
      "phone": phone,
     };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
