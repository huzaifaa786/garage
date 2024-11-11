import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class FilterOrderApi {
  static Future<Map<String, dynamic>> filterPriceOrder({
    String? startprice,
    String? endprice,
    String? categoryid,
  }) async {
    //* URL
    String url = '$baseUrl/price/filter';

    var data = {
      'lowprice': startprice,
      'highprice': endprice,
      'category_id': categoryid,
    };
    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }

  static Future<Map<String, dynamic>> filterextraOrder({
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
      if (categoryextraid != null) 'categoryextraid': categoryextraid,
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
      if (brandid != null) 'brand_id': brandid,
      if (widthid != null) 'tyer_width_id': widthid,
      if (heightid != null) 'tyer_height_id': heightid,
      if (sizeid != null) 'tyer_size_id': sizeid,
      if (speedratingid != null) 'tyer_speed_rating_id': speedratingid,
      if (patterenid != null) 'tyer_pattren_id': patterenid,
      if (originid != null) 'tyer_origin_id': originid,
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
      if (brandid != null) 'brand_id': brandid,
     if (productid != null) 'producttype_id': productid,
     if (originid != null) 'origin_id': originid,
     if (ampereid != null) 'ampere_id': ampereid,
     if (voltageid != null) 'voltage_id': voltageid,
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
      if (brandid != null) 'brand_id': brandid,
     if (productid != null)  'oil_product_type_id': productid,
     if (voilumeid != null)  'oil_volume_id': voilumeid,
     if (extraid != null)  'categoryextraid': extraid,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
