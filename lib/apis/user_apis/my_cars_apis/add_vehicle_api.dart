import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class AddVehiclesApi {
  static Future<Map<String, dynamic>> addvehicles({
    required List<Map<String, dynamic>> includes,
  }) async {
    //* URL
    String url = '${baseUrl}/add/user/vehicle';

    var data = {
      "include": includes,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
