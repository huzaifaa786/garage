import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VContactUsApi {
  static Future<Map<String, dynamic>> getContacts() async {
    String url = '$vbaseUrl/contactus';
    var response = await DioService.get(url: url);
    return response;
  }
}
