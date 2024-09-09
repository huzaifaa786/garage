import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VAddProductApi {
  static Future<Map<String, dynamic>> addProduct({
    List<String>? images,
    String? categoryid,
    String? brandid,
    String? time,
    List<Map<String, dynamic>>? options,
  }) async {
    String url = '$vbaseUrl/store/product';

    var data = {
      "images": images,
      "category_id": categoryid,
      "brand_id": brandid,
      "service_minute": time,
      "include": options,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
