import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VAddProductApi {
  static Future<Map<String, dynamic>> addProduct({
    List<String>? images,
    String? categoryid,
    String? brandid,
    String? brandprice,
    String? branddescription,
    String? time,
    List<Map<String, String>>? options,
  }) async {
    String url = '$vbaseUrl/store/product';

    var data = {
      "images": images,
      "category_id": categoryid,
      "brand_id": brandid,
      "images": brandprice,
      "images": branddescription,
      "service_minute": time,
      "images": options,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
