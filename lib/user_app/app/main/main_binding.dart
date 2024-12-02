import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/app/profile/account_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => AccountController());

   
  }
}
