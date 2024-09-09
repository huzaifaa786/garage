import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VGetBrandsApi {
  static Future<Map<String, dynamic>> getBrands({
    String? id,
  }) async {
    String url = '$vbaseUrl/brands';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
