import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetGarageApi {
  static Future<Map<String, dynamic>> getgarage() async {
    String url = '$vbaseUrl/profile';
    var response = await DioService.get(url: url);
    return response;
  }
}
