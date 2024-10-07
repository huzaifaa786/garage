import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/accapted_order/accapted_order_controller.dart';

class AccaptedOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccaptedOrderController());
  }
}
