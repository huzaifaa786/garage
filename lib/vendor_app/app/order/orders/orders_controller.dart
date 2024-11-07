import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/orders_apis/change_order_status_api.dart';
import 'package:mobilegarage/apis/vender_apis/orders_apis/orders_byStatus_api.dart';
import 'package:mobilegarage/apis/vender_apis/orders_apis/quick_orders_api.dart';
import 'package:mobilegarage/models/order_models/order_status_model.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class VOrdersController extends GetxController {
  static VOrdersController instance = Get.find();

  GetStorage box = GetStorage();

  int selectedIndex = 0;
  int selectedSubIndex = 0;

  List<OrdersModel>? orders = [];
  List<OrderProgressModel> allOrders = [];
  List<OrdersModel> pendingOrders = [];
  List<OrdersModel> acceptedOrders = [];
  List<OrdersModel> onTheWayOrders = [];
  List<OrdersModel> deliveredOrders = [];
  List<OrdersModel> rejectedOrders = [];

  List<Map<String, dynamic>> filterList = [
    {'Name': 'New orders'.tr},
    {'Name': 'On the way'.tr},
    {'Name': 'Delivered'.tr},
    {'Name': 'Rejected'.tr},
  ];

  List<Map<String, dynamic>> subFilterList = [
    {'Name': 'Pending'.tr},
    {'Name': 'Accepted'.tr},
  ];

  @override
  void onInit() async {
    super.onInit();
    await fetchOrders();
    await getUrgentOrders();
  }

  /// Formats the date in 'yyyy-MM-dd' format.
  String formatDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }

   /// Formats the time in 12-hour format with localized AM/PM.
  String formatTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(parsedDate);

    // Check if locale is Arabic and replace AM/PM with localized equivalents
    if (Get.locale?.languageCode == 'ar') {
      formattedTime = formattedTime.replaceAll('AM', 'ص').replaceAll('PM', 'م');
    }
    return formattedTime;
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

  List<OrdersModel> _mapOrders(List<dynamic> orders) {
    return (orders).map((order) => OrdersModel.fromJson(order)).toList();
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

  OrdersModel getOrder(int index) {
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

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $phoneUri');
    }
  }

  List<OrdersModel> urgentOrders = [];

  getUrgentOrders() async {
    var response = await QuickOrdersApi.quickOrders();
    if (response.isNotEmpty) {
      urgentOrders = (response['orders'] as List<dynamic>)
          .map((item) => OrdersModel.fromJson(item as Map<String, dynamic>))
          .toList();
      update();
    }
  }

  acceptOrder(id) async {
    var response = await ChangeOrderStatusApi.changeOrderStatus(
        orderId: id, status: 'accepted');
    if (response.isNotEmpty) {
      await fetchOrders();
      await getUrgentOrders();
    }
  }

  rejectedOrder(id) async {
    var response = await ChangeOrderStatusApi.changeOrderStatus(
        orderId: id, status: 'rejected');
    if (response.isNotEmpty) {
      await fetchOrders();
      await getUrgentOrders();
    }
  }

  ontheWayOrder(id) async {
    var response = await ChangeOrderStatusApi.changeOrderStatus(
        orderId: id, status: 'on_the_way');
    if (response.isNotEmpty) {
      await fetchOrders();
    }
  }

  deliveredOrder(id) async {
    var response = await ChangeOrderStatusApi.changeOrderStatus(
        orderId: id, status: 'delivered');
    if (response.isNotEmpty) {
      await fetchOrders();
    }
  }


}
