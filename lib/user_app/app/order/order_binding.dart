import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OrderController());
  }
}
