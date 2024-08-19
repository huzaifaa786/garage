import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_controller.dart';

class AccaptedOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccaptedOrderController());
  }
}
