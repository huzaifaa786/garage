import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GarageUserRatingApi {
  static Future<Map<String, dynamic>> garageReviews(id) async {
    String url = '$baseUrl/garage/ratings/$id';
    var response = await DioService.get(url: url);
    return response;
  }
}
