import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class ChangeOrderStatusApi {
  static Future<Map<String, dynamic>> changeOrderStatus(
     { String? orderId, String? status}) async {
    String url;

    switch (status) {
      case 'accepted':
        url = '$vbaseUrl/accept/order';
        break;
      case 'rejected':
        url = '$vbaseUrl/reject/order';
        break;
      // case 'cancelled':
      //   url = '$vbaseUrl/cancel/order';
      //   break;
      case 'on_the_way':
        url = '$vbaseUrl/onway/order';
        break;
      case 'delivered':
        url = '$vbaseUrl/deliver/order';
        break;
      default:
        throw Exception('Invalid order status');
    }

    var data = {
      'order_id': orderId,
    };

    //! Make the POST request using ApiService
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
