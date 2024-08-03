import 'package:get/get.dart';
import 'package:mobilegarage/app/home/home_controller.dart';
import 'package:mobilegarage/app/order/order_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OrderController);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AccountController());
  }
}
