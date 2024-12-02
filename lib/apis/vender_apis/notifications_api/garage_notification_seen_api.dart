import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class  GarageNotificationSeenApi{
  static Future<Map<String, dynamic>> seenNotification() async {
    String url = '$vbaseUrl/seen/notification';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
