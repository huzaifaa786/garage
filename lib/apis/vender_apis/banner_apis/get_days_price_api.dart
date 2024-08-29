import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VGetDayAndPriceApi {
  static Future<Map<String, dynamic>> getDayAndPrice() async {
    String url = '$vbaseUrl/banner/price';
    var response = await DioService.get(url: url);
    return response;
  }
}
