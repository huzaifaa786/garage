import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_controller.dart';

class VProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VProductsController());
  }
}