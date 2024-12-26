import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class OrdersSalesApi {
  static Future<Map<String, dynamic>> getSales(
    String? startDate,
    String? endDate,
  ) async {
    String url = '$vbaseUrl/sale/by/dates';
    var data = {
      "start_date": startDate,
      "end_date": endDate,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }

//
  static Future<Map<String, dynamic>> getSalesForDate(String date) async {
    String url = '$vbaseUrl/show/sales';
    var data = {
      "date": date,
    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
