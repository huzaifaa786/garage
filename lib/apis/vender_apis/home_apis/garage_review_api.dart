import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GarageReviewsApi {
  static Future<Map<String, dynamic>> garageReviews(id) async {
    String url = '$vbaseUrl/ratings/$id';
    var response = await DioService.get(url: url);
    return response;
  }
}
