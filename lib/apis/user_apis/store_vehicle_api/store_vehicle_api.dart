import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class StoreVehicleApi {
  static Future<Map<String, dynamic>> storevehicleid(vehicleid) async {
    //* URL
    String url = '$baseUrl/store/selected/vehicle';
    var data ={
      'user_vehicle_id':vehicleid
    };
    var response = await DioService.post(url: url,data: data);
    return response;
  }
}
