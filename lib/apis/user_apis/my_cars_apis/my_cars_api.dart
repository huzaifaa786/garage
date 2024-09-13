import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class UserVehiclesService {
  static Future<Map<String, dynamic>> getUserVehicles() async {
    String url = '$baseUrl/uservehicle';


    var response = await DioService.get(url: url,);

    return response;
  }
}
