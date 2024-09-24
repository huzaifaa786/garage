import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class PostApi {
  static Future<Map<String, dynamic>> getAllGarages() async {
    //* URL

    String url = '${baseUrl}/garages/search';
    //! Make the GET request using ApiService
    var response = await DioService.post(url: url);
    return response;
  }
}
