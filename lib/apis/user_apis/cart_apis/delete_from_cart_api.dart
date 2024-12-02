import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class DeleteFromCartApi {
  static Future<Map<String, dynamic>> deleteCart({String? cartItemId}) async {
    String url = '$baseUrl/delete/cart';

    var data = {
      'cartItemId': cartItemId,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
