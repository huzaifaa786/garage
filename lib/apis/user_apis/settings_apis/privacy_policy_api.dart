import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class PrivacyPolicyApi {
  static Future<Map<String, dynamic>> getPolicies() async {
    //* URL
    String url = '$baseUrl/privacy/policies';

    //! Make the Get request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }
}
