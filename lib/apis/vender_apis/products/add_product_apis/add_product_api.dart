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
  }) async {
    String url = '$vbaseUrl/add/tyer';

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

  //
  static Future<Map<String, dynamic>> addOilProduct({
    List<String>? images,
    String? categoryid,
    String? brandid,
    String? producttypeid,
    String? volumeid,
    String? price,
    String? description,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/add/oil/lubricant';

    var data = {
      "images": images,
      "category_id": categoryid,
      "brand_id": brandid,
      "oil_product_type_id": producttypeid,
      "oil_volume_id": volumeid,
      "description": description,
      "price": price,
      "oil_filter": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  //
  static Future<Map<String, dynamic>> addRoadAssistanceProduct({
    List<String>? images,
    String? categoryid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/store/road/assitance';

    var data = {
      "images": images,
      "category_id": categoryid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
//
  static Future<Map<String, dynamic>> addRecoveryProduct({
    List<String>? images,
    String? categoryid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/store/recovery/service';

    var data = {
      "images": images,
      "category_id": categoryid,
      "recoveryextra_extra": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
//
  static Future<Map<String, dynamic>> addFuelProduct({
    List<String>? images,
    String? categoryid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/store/fuel';

    var data = {
      "images": images,
      "category_id": categoryid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }


}
