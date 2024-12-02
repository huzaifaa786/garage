import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VEditProductApi {
  static Future<Map<String, dynamic>> editBatteryProduct({
    List<String>? images,
    String? productid,
    String? brandid,
    String? producttypeid,
    String? originid,
    String? ampereid,
    String? voltageid,
    String? price,
    String? description,
  }) async {
    String url = '$vbaseUrl/batteries/update';

    var data = {
      if (images != null && images.isNotEmpty) "images": images,
      "id": productid,
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
  static Future<Map<String, dynamic>> editTyreProduct({
    List<String>? images,
    String? productid,
    String? brandid,
    String? widthid,
    String? heightid,
    String? sizeid,
    String? originid,
    String? patterenid,
    String? price,
    String? description,
    String? speedratingid,
  }) async {
    String url = '$vbaseUrl/tyres/update';

    var data = {
      if (images != null && images.isNotEmpty) "images": images,
      "id": productid,
      "brand_id": brandid,
      "tyer_width_id": widthid,
      "tyer_height_id": heightid,
      "tyer_size_id": sizeid,
      "tyer_speed_rating_id": speedratingid,
      "tyer_origin_id": originid,
      "price": price,
      "description": description,
      "tyer_pattren_id": patterenid,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  //
  static Future<Map<String, dynamic>> editOilProduct({
    List<String>? images,
    String? productid,
    String? categoryid,
    String? brandid,
    String? producttypeid,
    String? volumeid,
    String? price,
    String? description,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/oillubricants/update';

    var data = {
      if (images != null && images.isNotEmpty) "images": images,
      "id": productid,
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
  static Future<Map<String, dynamic>> editRoadAssistanceProduct({
    List<String>? images,
    String? productid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/roadassistance/update';

    var data = {
   if (images != null && images.isNotEmpty)   "images": images,
      "id": productid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

//
  static Future<Map<String, dynamic>> editRecoveryProduct({
    List<String>? images,
    String? productid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/recoveryservices/update';

    var data = {
   if (images != null && images.isNotEmpty)   "images": images,
      "id": productid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

//
  static Future<Map<String, dynamic>> editFuelProduct({
    List<String>? images,
    String? productid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/fuelservices/update';

    var data = {
    if (images != null && images.isNotEmpty)  "images": images,
      "id": productid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

//
  static Future<Map<String, dynamic>> editCarWashProduct({
    List<String>? images,
    String? productid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/carwash/update';

    var data = {
     if (images != null && images.isNotEmpty) "images": images,
      "id": productid,
      "carwashextras": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

// //
  static Future<Map<String, dynamic>> editAcProduct({
    List<String>? images,
    String? productid,
    required List<Map<String, dynamic>> includes,
  }) async {
    String url = '$vbaseUrl/acservice/update';

    var data = {
   if (images != null && images.isNotEmpty)   "images": images,
      "id": productid,
      "fueldatas": includes,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
