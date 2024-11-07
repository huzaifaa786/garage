import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class  GarageNotificationCountApi{
  static Future<Map<String, dynamic>> countNotification() async {
    String url = '$vbaseUrl/notification/count';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
