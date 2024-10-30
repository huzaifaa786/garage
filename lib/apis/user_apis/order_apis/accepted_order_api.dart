import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class AcceptedOrderApi {
  static Future<Map<String, dynamic>> getOrder() async {
    String url = '$baseUrl/show/accepted/order';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
