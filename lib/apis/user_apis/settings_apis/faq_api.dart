import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class FaqApi {
  static Future<Map<String, dynamic>> getFaq() async {
    //* URL
    String url = '$baseUrl/faqs';

    //! Make the GET request using DioService
    var response = await DioService.get(url: url);
    return response;
  }
}
