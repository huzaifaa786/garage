import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class OrderVehiclesApi {
  Future<Map<String, dynamic>> getvehicles() async {
    //* URL
    String url = '${baseUrl}/uservehicle';

  //  var data = {
      // 'image': banner,
      // 'banner_price_id': selectedday,
  //  };

    //! Make the Get request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }

 
}
