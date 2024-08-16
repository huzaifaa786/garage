import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';

class VOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VOrdersController());
  }
}
