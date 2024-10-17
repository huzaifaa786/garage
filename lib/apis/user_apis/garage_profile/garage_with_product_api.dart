import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GarageWithProductApi {
  static Future<Map<String, dynamic>> garageProductData(
      {String? id, String? productid, String? productextraid}) async {
    String url = '$baseUrl/garage/filter';
    var data = {
      'garage_id': id,
      'product_id': productid,
      'product_extra_id': productextraid
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
