import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VEditProfileApi {
  static Future<Map<String, dynamic>> editProfile({
    String? banner,
    String? logo,
    String? description,
  }) async {
    String url = '$vbaseUrl/update/profile';

    var data = {
     if (description != null)  'description': description,
     if (banner != null)  'banner': banner,
     if (logo != null)  'logo': logo,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
