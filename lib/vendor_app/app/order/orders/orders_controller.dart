import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/orders_apis/pending_order_api.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:url_launcher/url_launcher.dart';

class VOrdersController extends GetxController {
  static VOrdersController instance = Get.find();
  GetStorage box = GetStorage();
  String? image;
  String? phoneNumber;
  int selectedIndex = 0;
  int selectedSubIndex = 0;
  List<OrdersModel> pendingOrders = [];

  @override
  void onInit() async {
    super.onInit();
    await getPendingOrders();
  }

  List<Map<String, dynamic>> filterList = [
    {
      'Name': 'New orders',
    },
    {
      'Name': 'On the way',
    },
    {
      'Name': 'Delivered',
    },
    {
      'Name': 'Rejected',
    },
  ];

  List<Map<String, dynamic>> subFilterList = [
    {
      'Name': 'Pending',
    },
    {
      'Name': 'Accepted',
    },
  ];

  void makePhoneCall(String phoneNumber) async {
    print(phoneNumber);
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  getPendingOrders() async {
    var response = await PendingOrderApi.pendingOrders();
    if (response.isNotEmpty) {
      List<dynamic> ordersList = response['orders'];
      pendingOrders =
          ordersList.map((order) => OrdersModel.fromJson(order)).toList();
    }
  }
}
