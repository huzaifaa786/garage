
import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class HomeApi {
   Future<Map<String, dynamic>> getbanners() async {
    //* URL
    String url = '${baseUrl}/users/banners';
  
   var data = {
      // 'image': banner,
      // 'banner_price_id': selectedday,


    };

    

    //! Make the POST request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }
}