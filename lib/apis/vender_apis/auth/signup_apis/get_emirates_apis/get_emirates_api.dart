import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class GetEmirates{
  static Future<Map<String, dynamic>> getEmirats()async{
String url = '$vbaseUrl/emirates';
  var response = await DioService.get(url: url,data: null);
    return response;
  }
}