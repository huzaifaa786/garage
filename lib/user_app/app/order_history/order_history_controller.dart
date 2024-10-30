import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/order_history_api.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:intl/intl.dart';

class OrderHistoryController extends GetxController {
  static OrderHistoryController instance = Get.find();

  List<OrdersModel>? orders = [];

  @override
  void onInit() async{
    super.onInit();
  await  getOrder();
  }

  // Function to format the date
  String formatDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

// Function to format the time
  String formatTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('hh:mm a').format(parsedDate);
  }

  getOrder() async {
    var response = await OrderHistoryApi.getOrder();
    if (response.isNotEmpty) {
      orders = (response['orders'] as List<dynamic>)
          .map((item) => OrdersModel.fromJson(item))
          .toList();
    }
    update();
  }
}
