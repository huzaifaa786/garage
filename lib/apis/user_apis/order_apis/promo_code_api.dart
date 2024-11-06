import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class PromoCodeApi {
  static Future<Map<String, dynamic>> checkPromoCode({
    String? name,
    String? price,

  }) async {
    String url = '$baseUrl/promo/match';
    var data = {
      'name': name,
      "price":price,

     };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
