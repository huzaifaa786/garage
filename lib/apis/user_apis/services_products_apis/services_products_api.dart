import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class ServicesProductsApi {
  static Future<Map<String, dynamic>> getproducts({String? garageid,String? serviceid}) async {
    String url = '$baseUrl/product/by/category';
    var data = {'garage_id': garageid,
    'category_id': serviceid};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}