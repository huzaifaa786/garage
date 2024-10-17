// ignore_for_file: non_constant_identifier_names

import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class AddToCartApi {
  static Future<Map<String, dynamic>> addToCart(
      {String? id,
      String? productid,
      String? quantity,
      String? product_extraid,
      }) async {
    String url = '$baseUrl/add/cart';
    var data;

    quantity == null
        ? data = {
            'garage_id': id,
            'product_id': productid,
            'quantity': '1',
            'product_extra_id': product_extraid
          }
        : data = {
            'garage_id': id,
            'product_id': productid,
            'quantity': quantity,
            'product_extra_id': product_extraid

          };

    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
