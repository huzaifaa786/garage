import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VChangePasswordApi {
  static Future<Map<String, dynamic>> changePassword({
    String? password,
    String? newpassword,
  }) async {
    String url = '$vbaseUrl/updatepassword';

    var data = {
     'password': password,
    'new_password': newpassword,
   
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
