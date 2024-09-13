import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';


class DeleteVehiclesApi {
  static Future<Map<String, dynamic>> deleteVehicles(id) async {
    String url = '$baseUrl/user/vehicles-delete';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
