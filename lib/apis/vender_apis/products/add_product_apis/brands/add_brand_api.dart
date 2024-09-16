import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VAddBrandsApi {
  static Future<Map<String, dynamic>> addBrands({
    String? id,
    String? name,
  }) async {
    String url = '$vbaseUrl/add/battery/brand';
    var data = {
      'category_id': id,
      'name': name,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
