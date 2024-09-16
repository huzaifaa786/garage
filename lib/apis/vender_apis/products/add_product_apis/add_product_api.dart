import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VAddProductApi {
  static Future<Map<String, dynamic>> addBatteryProduct({
    List<String>? images,
    String? categoryid,
    String? brandid,
    String? producttypeid,
    String? originid,
    String? ampereid,
    String? voltageid,
    String? price,
    String? description,

    // String? time,
    // List<Map<String, dynamic>>? options,
  }) async {
    String url = '$vbaseUrl/add/battery';

    var data = {
      "images": images,
      "category_id": categoryid,
      "brand_id": brandid,
      "producttype_id": producttypeid,
      "origin_id": originid,
       "ampere_id": ampereid,
      "voltage_id": voltageid,
       "price": price,
      "description": description, 
     
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  //
   static Future<Map<String, dynamic>> addTyreProduct({
    List<String>? images,
    String? categoryid,
    String? brandid,
    String? widthid,
    String? heightid,
    String? sizeid,
    String? originid,
    String? patterenid,
    String? price,
    String? speedratingid,

    // String? time,
    // List<Map<String, dynamic>>? options,
  }) async {
    String url = '$vbaseUrl/add/battery';

    var data = {
      "images": images,
      "category_id": categoryid,
      "brand_id": brandid,
      "tyer_width_id": widthid,
      "tyer_height_id": heightid,
       "tyer_size_id": sizeid,
      "tyer_speed_rating_id": speedratingid,
      "tyer_origin_id": originid,
       "price": price,
      "tyer_pattren_id": patterenid, 
     
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
