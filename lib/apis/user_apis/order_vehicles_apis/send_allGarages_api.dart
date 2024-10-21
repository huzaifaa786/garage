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
  }) async {
    //* URL
    String url = '$baseUrl/place/order';

    var data = {
      'id': id,
      'user_vehicle_id': vehicleId,
      'lowprice': lowprice,
      'highprice': highprice,
      'categoryextraid': categoryextraId,
      'order_type': 'send_to_all',
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
