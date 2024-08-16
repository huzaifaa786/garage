import 'package:get/get.dart';
import 'package:mobilegarage/app/cart/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => CartController(),
    );
  }
}
