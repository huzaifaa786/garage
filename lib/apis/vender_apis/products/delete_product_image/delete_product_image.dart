import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VDeleteProductImageApi {
  static Future<Map<String, dynamic>> deleteImage({
    String? productid,
    String? imageid,
  }) async {
    String url = '$vbaseUrl/delete/productimage';
    var data = {"id": productid, "image_id": imageid};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
