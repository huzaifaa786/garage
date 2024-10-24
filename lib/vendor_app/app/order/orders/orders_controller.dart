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
    await fetchOrders();
  }

  Future<void> fetchOrders() async {
    var response = await OrdersbyStatusApi.getOrders();
    if (response.isNotEmpty && response['orders_by_status'] is Map) {
      _parseOrders(response['orders_by_status']);
    }
    update();
  }

  void _parseOrders(Map<String, dynamic> ordersByStatus) {
    if (ordersByStatus.containsKey("new_orders")) {
      Map<String, dynamic> newOrders = ordersByStatus['new_orders'];

      pendingOrders = _mapOrders(newOrders['PENDING']);
      acceptedOrders = _mapOrders(newOrders['ACCEPTED']);
    }
    onTheWayOrders = _mapOrders(ordersByStatus['ON_THE_WAY']);
    deliveredOrders = _mapOrders(ordersByStatus['DELIVERED']);
    rejectedOrders = _mapOrders(ordersByStatus['REJECTED']);
  }

  List<OrderProgressModel> _mapOrders(List<dynamic> orders) {
    return (orders).map((order) => OrderProgressModel.fromJson(order)).toList();
  }

  int getItemCount() {
    switch (selectedIndex) {
      case 0:
        return selectedSubIndex == 0
            ? pendingOrders.length
            : acceptedOrders.length;
      case 1:
        return onTheWayOrders.length;
      case 2:
        return deliveredOrders.length;
      case 3:
        return rejectedOrders.length;
      default:
        return 0;
    }
  }

  OrderProgressModel getOrder(int index) {
    switch (selectedIndex) {
      case 0:
        return selectedSubIndex == 0
            ? pendingOrders[index]
            : acceptedOrders[index];
      case 1:
        return onTheWayOrders[index];
      case 2:
        return deliveredOrders[index];
      case 3:
        return rejectedOrders[index];
      default:
        throw Exception("Invalid selectedIndex or selectedSubIndex");
    }
  }

  //! date and time 
  String getOrderDate(VOrdersController controller) {
    switch (controller.selectedIndex) {
      case 0:
        switch (controller.selectedSubIndex) {
          case 0:
            return controller.allOrders.isNotEmpty &&
                    controller.allOrders[controller.selectedSubIndex].newOrders!
                        .pendingOrders!.isNotEmpty
                ? '${controller.allOrders[controller.selectedSubIndex].newOrders!.pendingOrders![controller.selectedIndex].createdAt}'
                : '';

          case 1:
            return controller.allOrders.isNotEmpty &&
                    controller.allOrders[controller.selectedSubIndex].newOrders!
                        .acceptedOrders!.isNotEmpty
                ? '${controller.allOrders[controller.selectedSubIndex].newOrders!.acceptedOrders![0].createdAt}'
                : '';

          default:
            return '';
        }

      case 1:
        return controller.onTheWayOrders.isNotEmpty
            ? '${controller.onTheWayOrders[0].inProgressOrders![selectedIndex].createdAt}'
            : '';

      case 2:
        return controller.deliveredOrders.isNotEmpty
            ? '${controller.deliveredOrders[0].completedOrders![selectedIndex].createdAt}'
            : '';

      case 3:
        return controller.rejectedOrders.isNotEmpty
            ? '${controller.rejectedOrders[0].cancelledOrders![selectedIndex].createdAt}'
            : '';

      default:
        return '';
    }
  }
}
