import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VSignupApi {
  static Future<Map<String, dynamic>> registerapi({
    String? name,
    String? ownername,
    String? banner,
    String? logo,
    String? idfrontside,
    String? idbackside,
    String? license,
    String? description,
    String? phone,
    String? lat,
    String? lng,
    String? emirateid,
      String? addressdetail,
    String? email,
    String? password,}
   

  ) async {
    String url = '$vbaseUrl/register';
    var data = {
      'name': name,
      'owner_name': ownername,
      'banner': banner,
      'id_front': idfrontside,
      'id_back': idbackside,
      'license': license,
      'description': description,
      'phone': phone,
      'lat': lat,
      'lng': lng,
      'emirate_id': emirateid,
      'address': addressdetail,
      'password': password,
      'email': email,
      'logo': logo,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
