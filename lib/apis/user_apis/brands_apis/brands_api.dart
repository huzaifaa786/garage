import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class brandsApi {
  static Future<Map<String, dynamic>> brands({String? id}) async {
    //* URL
    String url = '${baseUrl}/product/allbrands';

    var data = {
      'category_id': id,
    };

    //! Make the Get request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
