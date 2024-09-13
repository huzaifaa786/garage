import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class FilterOrderApi {
  static Future<Map<String, dynamic>> filterOrder({
    String? startprice,
    String? endprice,
  }) async {
    //* URL
    String url = '${baseUrl}/price/filter';

    var data = {
      'lowprice': startprice,
      'high': endprice,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
