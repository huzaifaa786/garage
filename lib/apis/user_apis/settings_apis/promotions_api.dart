import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class PromotionsApi {
  static Future<Map<String, dynamic>> garagePromotions() async {
    String url = '$baseUrl/promotions';
    var response = await DioService.get(url: url);
    return response;
  }
}
