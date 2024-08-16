import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order_history/order_history_controller.dart';

class OrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderHistoryController());
  }
}
