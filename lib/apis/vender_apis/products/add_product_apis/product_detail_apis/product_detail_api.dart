import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VProductDetailApi{
  static Future<Map<String, dynamic>> getProductDetails({
    String? id,
  })async{
    String url = '$vbaseUrl/category/detail';
    var data = {
      'category_id':id
    };
    var response = await DioService.post(url: url,data: data);
    return response;
  }
}