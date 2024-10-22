import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class CartDetailApi {
  static Future<Map<String, dynamic>> getCartData() async {
    String url = '$baseUrl/show/cart';
   
    var response = await DioService.get(url: url,);
    return response;
  }
}
