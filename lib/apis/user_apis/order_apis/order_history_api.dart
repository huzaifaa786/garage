import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class OrderHistoryApi {
  static Future<Map<String, dynamic>> getOrder() async {
    String url = '$baseUrl/show/order/history';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
