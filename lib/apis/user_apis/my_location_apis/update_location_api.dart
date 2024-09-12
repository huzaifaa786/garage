import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class  UpdateLocationApi{
  static Future<Map<String , dynamic>> updateLocation({
    String? emirateId,
    String?  addressdetail,
    String?  lat,
    String?  lng,

  })async{
    String url = '$baseUrl/update/location';
    var data ={
      'lat':lat,
      'lng':lng,
      'emirate':emirateId,
      'address':addressdetail,

    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}