import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GarageReviewsApi {
  static Future<Map<String, dynamic>> garageReviews() async {
    String url = '$vbaseUrl/garage/ratings/1';
    var response = await DioService.get(url: url);
    return response;
  }
}
