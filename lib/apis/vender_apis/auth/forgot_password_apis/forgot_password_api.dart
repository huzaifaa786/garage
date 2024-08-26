import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VForgotPasswordApi {
  static Future<Map<String, dynamic>> forgotpassword({String? email}) async {
    String url = '$vbaseUrl/forgetpassword';
    var data = {
      'email': email,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  ////////////////////////////////////////////////
  static Future<Map<String, dynamic>> verifyotp({
    String? otp,
    String? email,
  }) async {
    //* URL
    String url = '$vbaseUrl/verifyOtp';

    //* DATA
    var data = {
      'otp': otp,
      'email': email,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> updatepassword({
    String? email,
    String? password,
  }) async {
    //* URL
    String url = '${vbaseUrl}/forgetUpdatePassword';

    //* DATA
    var data = {
      'email': email,
      'password': password,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
