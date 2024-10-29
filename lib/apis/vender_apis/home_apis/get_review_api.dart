import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetReviewApi {
  static Future<Map<String, dynamic>> getgarageReview(id) async {
    String url = '$vbaseUrl/ratings/$id';
    var response = await DioService.get(url: url);
    return response;
  }
}
