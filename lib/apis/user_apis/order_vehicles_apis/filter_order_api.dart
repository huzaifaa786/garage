import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class FilterOrderApi {
  static Future<Map<String, dynamic>> filterexraOrder({
    String? startprice,
    String? endprice,
    String? categoryid,
    String? categoryextraid,
  }) async {
    //* URL
    String url = '$baseUrl/filter/garage';

    var data = {
      'lowprice': startprice,
      'highprice': endprice,
      'id': categoryid,
      'categoryextraid': categoryextraid,
    };
    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> filterTyreOrder({
    String? startprice,
    String? endprice,
    String? categoryid,
    String? brandid,
    String? widthid,
    String? heightid,
    String? originid,
    String? sizeid,
    String? speedratingid,
    String? patterenid,
  }) async {
    //* URL
    String url = '${baseUrl}/filter/garage';

    var data = {
      'lowprice': startprice,
      'highprice': endprice,
      'id': categoryid,
      'brand_id': brandid,
      'tyer_width_id': widthid,
      'tyer_height_id': heightid,
      'tyer_size_id': sizeid,
      'tyer_speed_rating_id': speedratingid,
      'tyer_pattren_id': patterenid,
      'tyer_origin_id': originid,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> filterBatteryOrder({
    String? startprice,
    String? endprice,
    String? categoryid,
    String? brandid,
    String? productid,
    String? originid,
    String? ampereid,
    String? voltageid,
  }) async {
    //* URL
    String url = '${baseUrl}/filter/garage';

    var data = {
      'lowprice': startprice,
      'highprice': endprice,
      'id': categoryid,
      'brand_id': brandid,
      'producttype_id': productid,
      'origin_id': originid,
      'ampere_id': ampereid,
      'voltage_id': voltageid,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> filterOilOrder({
    String? startprice,
    String? endprice,
    String? categoryid,
    String? brandid,
    String? productid,
    String? voilumeid,
    String? extraid,
  }) async {
    //* URL
    String url = '${baseUrl}/filter/garage';

    var data = {
      'lowprice': startprice,
      'highprice': endprice,
      'id': categoryid,
      'brand_id': brandid,
      'oil_product_type_id': productid,
      'oil_volume_id': voilumeid,
      'categoryextraid': extraid,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
