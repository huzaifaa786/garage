import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetUnavailableDatesApi {
  static Future<Map<String, dynamic>> getUnAvailableDates() async {
    String url = '$vbaseUrl/garage/unavailable-dates';
    var response = await DioService.get(url: url);
    return response;
  }
}
