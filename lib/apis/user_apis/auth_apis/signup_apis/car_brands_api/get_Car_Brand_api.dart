import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GetCarBrandApi {
  static Future<Map<String, dynamic>> getBrands(id) async {
    String url = '$baseUrl/vehiclebrands';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
