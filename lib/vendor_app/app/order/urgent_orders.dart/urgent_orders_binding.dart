import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';

class VUrgentOrdersBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VOrdersController());
  }
}
