import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class OrdersbyStatusApi {
  static Future<Map<String, dynamic>> getOrders() async {
    String url = '$vbaseUrl/all/orders';
    var response = await DioService.get(url: url);
    return response;
  }
}
