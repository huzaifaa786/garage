import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class TermsAndConditionsApi {
  static Future<Map<String, dynamic>> getTermsConditions() async {
    //* URL
    String url = '$baseUrl/terms-and-conditions';

    //! Make the Get request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }
}
