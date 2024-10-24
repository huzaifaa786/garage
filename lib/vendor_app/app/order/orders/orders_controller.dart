import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/orders_apis/orders_byStatus_api.dart';
import 'package:mobilegarage/models/order_models/order_status_model.dart';

class VOrdersController extends GetxController {
  static VOrdersController instance = Get.find();
  GetStorage box = GetStorage();
  int selectedIndex = 0;
  int selectedSubIndex = 0;

  List<OrderProgressModel> allOrders = [];
  List<OrderProgressModel> pendingOrders = [];
  List<OrderProgressModel> acceptedOrders = [];
  List<OrderProgressModel> onTheWayOrders = [];
  List<OrderProgressModel> deliveredOrders = [];
  List<OrderProgressModel> rejectedOrders = [];

  List<Map<String, dynamic>> filterList = [
    {'Name': 'New orders'},
    {'Name': 'On the way'},
    {'Name': 'Delivered'},
    {'Name': 'Rejected'},
  ];

  List<Map<String, dynamic>> subFilterList = [
    {'Name': 'Pending'},
    {'Name': 'Accepted'},
  ];

  @override
  void onInit() async {
    super.onInit();
    await getPendingOrders();
  }

  getPendingOrders() async {
    var response = await OrdersbyStatusApi.getOrders();
    if (response.isNotEmpty && response['orders_by_status'] is Map) {
      Map<String, dynamic> ordersByStatus = response['orders_by_status'];

      if (ordersByStatus.containsKey("new_orders")) {
        Map<String, dynamic> newOrders = ordersByStatus['new_orders'];

        if (newOrders.containsKey("PENDING")) {
          pendingOrders = (newOrders['PENDING'] as List)
              .map((order) => OrderProgressModel.fromJson(order))
              .toList();
        }

        if (newOrders.containsKey("ACCEPTED")) {
          acceptedOrders = (newOrders['ACCEPTED'] as List)
              .map((order) => OrderProgressModel.fromJson(order))
              .toList();
        }

        if (ordersByStatus.containsKey("ON_THE_WAY")) {
          onTheWayOrders = (ordersByStatus['ON_THE_WAY'] as List)
              .map((order) => OrderProgressModel.fromJson(order))
              .toList();
        }

        if (ordersByStatus.containsKey("DELIVERED")) {
          deliveredOrders = (ordersByStatus['DELIVERED'] as List)
              .map((order) => OrderProgressModel.fromJson(order))
              .toList();
        }

        if (ordersByStatus.containsKey("REJECTED")) {
          rejectedOrders = (ordersByStatus['REJECTED'] as List)
              .map((order) => OrderProgressModel.fromJson(order))
              .toList();
        }
      }
    }
    update();
  }
}
