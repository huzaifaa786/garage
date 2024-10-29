import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class ratingsApi {
  static Future<Map<String, dynamic>> checkGarageRatings() async {
    //* URL

    String url = '$baseUrl/rating/check';

    //! Make the Get request using ApiService
    var response = await DioService.get(url: url);
    return response;
  }

  Future<Map<String, dynamic>> storeRatings(double? rating) async {
    String url = '$baseUrl/services';
    var data = {
      'rating': rating,
    };

    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
