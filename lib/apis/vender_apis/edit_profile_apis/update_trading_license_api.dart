import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VUpdateLicenseApi {
  static Future<Map<String, dynamic>> updateLicense(license) async {
    String url = '$vbaseUrl/update/license';
    var data = {'license': license};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
