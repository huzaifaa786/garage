import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VDeleteProductsApi {
  static Future<Map<String, dynamic>> deleteProducts(id) async {
    String url = '$vbaseUrl/delete';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
