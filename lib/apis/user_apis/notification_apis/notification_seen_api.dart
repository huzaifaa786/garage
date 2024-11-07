import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class  UserNotificationSeenApi{
  static Future<Map<String, dynamic>> seenNotification() async {
    String url = '$baseUrl/seen/notification';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
