import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VAddBannerApi {
  static Future<Map<String, dynamic>> addBanner({
    String? banner,
    String? selectedday,
     String? intent
  }) async {
    String url = '$vbaseUrl/store/banner';

    var data = {
      'image': banner,
      'banner_price_id': selectedday,
      'payment_intent': intent,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
