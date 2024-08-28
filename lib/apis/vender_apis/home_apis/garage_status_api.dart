import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VGarageStatusApi{
   static Future<Map<String, dynamic>> updateGarrageStatus() async {
    String url = '$vbaseUrl/toggle/opened';
    var response = await DioService.get(url: url);
    return response;
  }
}