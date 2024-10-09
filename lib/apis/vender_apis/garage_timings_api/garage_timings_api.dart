import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GarageTimingsApi {
  static Future<Map<String, dynamic>> garageTimings({
    required List<Map<String, dynamic>> garagetimes,
  }) async {
    String url = '$vbaseUrl/update/time';

    var data = {
      "garagetimes": garagetimes,
    };

    var response = await DioService.post(url: url, data: data);

    return response;
  }
}
