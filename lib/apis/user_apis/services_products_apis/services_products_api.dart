import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class ServicesProductsApi {
  static Future<Map<String, dynamic>> getproducts(
      {String? garageid, String? serviceid}) async {
    String url = '$baseUrl/specific/product';
    var data = {'garage_id': garageid, 'service_id': serviceid};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
