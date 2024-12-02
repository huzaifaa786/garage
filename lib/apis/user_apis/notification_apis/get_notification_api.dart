import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GetNotificationApi {
  static Future<Map<String, dynamic>> getNotification() async {
    String url = '$baseUrl/show/notification';
    var response = await DioService.get(
      url: url,
    );
    return response;
  }
}
