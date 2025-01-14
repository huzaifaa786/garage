import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VendorNotificationsApi {
  static Future<Map<String, dynamic>> garageNotifications(
      String? garageId) async {
    String url = '$vbaseUrl/show/order/notification';

    var response = await DioService.get(
      url: url
    );
    return response;
  }
}
