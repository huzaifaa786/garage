import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class AboutusApi {
  static Future<Map<String, dynamic>> getAboutUs() async {
    //* URL
    String url = '$baseUrl/aboutus';

    //! Make the Get request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }
}
