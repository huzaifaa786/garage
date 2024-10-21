import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class PendingOrderApi {
  static Future<Map<String, dynamic>> pendingOrders() async {
    String url = '$vbaseUrl/show/pending/orders';
    var response = await DioService.get(url: url);
    return response;
  }
}
