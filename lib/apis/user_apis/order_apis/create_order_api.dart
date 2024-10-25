import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class CreateOrderApi {
  static Future<Map<String, dynamic>> createOrder({
    String? paymentintent,
    String? paymentmethod,
    String? deliverytime,
    String? ordertype,
    String? vehicleid,
    String? servicetype,

  }) async {
    String url = '$baseUrl/place/order';
    var data = {
      'payment_intent': paymentintent,
      'payment_method': paymentmethod,
      'delivery_time': deliverytime,
      'order_type': ordertype,
      'user_vehicle_id': vehicleid,
      'service_type': servicetype,

    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
