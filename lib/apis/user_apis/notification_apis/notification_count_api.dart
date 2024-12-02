import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class  UserNotificationCountApi{
  static Future<Map<String, dynamic>> countNotification() async {
    String url = '$baseUrl/notification/count';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
