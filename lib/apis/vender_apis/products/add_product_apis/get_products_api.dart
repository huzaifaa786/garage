import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VGetProductsApi {
  static Future<Map<String, dynamic>> getProducts() async {
    String url = '$vbaseUrl/get/products';
    var response = await DioService.get(url: url);
    return response;
  }
}
