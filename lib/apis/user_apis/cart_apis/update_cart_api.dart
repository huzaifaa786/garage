import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class UpdateCartApi {
  static Future<Map<String, dynamic>> updateCart(
      {String? cartItemId, String? quantity}) async {
    String url = '$baseUrl/update/cart';

    var data = {
      'cartItemId': cartItemId,
      'quantity': quantity,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
