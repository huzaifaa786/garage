import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class QuickOrdersApi {
  static Future<Map<String, dynamic>> quickOrders() async {
    String url = '$vbaseUrl/show/urgents/orders';
    var response = await DioService.get(url: url);
    return response;
  }
}
