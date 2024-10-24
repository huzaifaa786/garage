import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class OrdersSalesApi {
  static Future<Map<String, dynamic>> getSales() async {
    String url = '$vbaseUrl/show/sales';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
