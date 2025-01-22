import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class SendAllgaragesApi {
  static Future<Map<String, dynamic>> sendAllGarages({
    String? id,
    String? vehicleId,
    String? lowprice,
    String? highprice,
    String? categoryextraId,
    String? orderType,

    //
    String? brandid,
    String? productid,
    String? originid,
    String? ampereid,
    String? voltageid,
    //
    String? widthid,
    String? heightid,
    String? tyreoriginid,
    String? sizeid,
    String? speedratingid,
    String? patterenid,
    //
    String? oilproductid,
    String? voilumeid,
    // String? extraid,
  }) async {
    //* URL
    String url = '$baseUrl/place/order';

    var data = {
      //    For category id 1,4,7,8,9

      if (id != 'null' && id != null) 'id': id,
      if (vehicleId != 'null' && vehicleId != null)
        'user_vehicle_id': vehicleId,
      if (lowprice != 'null' && lowprice != null) 'lowprice': lowprice,
      if (highprice != 'null' && highprice != null) 'highprice': highprice,
      if (categoryextraId != null && categoryextraId != 'null')
        'categoryextraid': categoryextraId,
      'order_type': 'send_to_all',

      //  For category id 6

      if (brandid != null && brandid != 'null') 'brand_id': brandid,
      if (productid != null && productid != 'null') 'producttype_id': productid,
      if (originid != null && originid != 'null') 'origin_id': originid,
      if (ampereid != null && ampereid != 'null') 'ampere_id': ampereid,
      if (voltageid != null && voltageid != 'null') 'voltage_id': voltageid,

      // For category id 3

      if (widthid != null && widthid != 'null') 'tyer_width_id': widthid,
      if (heightid != null && heightid != 'null') 'tyer_height_id': heightid,
      if (sizeid != null && sizeid != 'null') 'tyer_size_id': sizeid,
      if (speedratingid != null && speedratingid != 'null')
        'tyer_speed_rating_id': speedratingid,
      if (patterenid != null && patterenid != 'null')
        'tyer_pattren_id': patterenid,
      if (tyreoriginid != null && tyreoriginid != 'null')
        'tyer_origin_id': tyreoriginid,
      //
      if (oilproductid != null && oilproductid != 'null')
        'oil_product_type_id': oilproductid,
      if (voilumeid != null && voilumeid != 'null') 'oil_volume_id': voilumeid,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
