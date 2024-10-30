import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class ratingsApi {
  static Future<Map<String, dynamic>> checkGarageRatings() async {
    String url = '$baseUrl/rating/check';

    var response = await DioService.get(url: url);
    return response;
  }

  static Future<Map<String, dynamic>> storeRatings({
    String? rating,
    String? orderid,
    String? comment,
    String? garageid,

  }) async {
    String url = '$baseUrl/store/rating';
    var data = {
      'rating': rating,
      'order_id': orderid,
      'comment': comment,
      'garage_id': garageid,

    };

    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
