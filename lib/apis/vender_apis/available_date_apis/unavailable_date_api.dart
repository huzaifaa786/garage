import 'package:mobilegarage/services/dio_service.dart';
import 'package:intl/intl.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VUnvailableDateApi {
  static Future<Map<String, dynamic>> storeUnavailableDates(
      List<DateTime> dates) async {
    String url = '$vbaseUrl/update/unavailable-dates';
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    List<String> dateStrings =
        dates.map((date) => formatter.format(date)).toList();
    var data = {"dates": dateStrings};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
