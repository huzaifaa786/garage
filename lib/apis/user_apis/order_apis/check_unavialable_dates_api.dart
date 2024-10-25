import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class CheckDateApi {
  static Future<Map<String, dynamic>> checkunavialabledate({
    String? date,
    String? garageid,

   
  }) async {
    String url = '$baseUrl/check-date-availability';
    var data = {
      'date': date,
      "garage_id":garageid,

     };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
