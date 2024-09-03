import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class GetCarBrandNameApi {
  static Future<Map<String, dynamic>> getVechilesBrandName(id) async {
    String url = '$baseUrl/vehiclebrandnames';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
