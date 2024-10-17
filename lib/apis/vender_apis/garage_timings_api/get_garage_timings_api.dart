import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetGarageTimingsApi {
  static Future<Map<String, dynamic>> fetchGarageTimings() async {
    String url = '$vbaseUrl/garage/latest-time';
    var response = await DioService.get(url: url);
    return response;
  }
}
