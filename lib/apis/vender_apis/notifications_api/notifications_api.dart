import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class VendorNotificationsApi {
  static Future<Map<String, dynamic>> garageNotifications(
      String? garageId) async {
    String url = '$baseUrl/show/order/notification';
    var data = {
      "garage_id": garageId,
    };

    var response = await DioService.post(
      url: url,
      data: data,
    );
    return response;
  }
}
