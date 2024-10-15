import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetUnavaliableDatesApi {
  static Future<Map<String, dynamic>> getUnavaliableDates() async {
    String url = '$vbaseUrl/update/unavailable-dates';
    var response = await DioService.get(url: url);
    return response;
  }
}
