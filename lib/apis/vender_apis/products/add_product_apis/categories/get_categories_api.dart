import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VGetCategoriesApi {
  static Future<Map<String, dynamic>> getCategories() async {
    String url = '$vbaseUrl/services';
    var response = await DioService.get(url: url);
    return response;
  }
}
