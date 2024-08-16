import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/product_form_controller.dart';

class ProductFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductFormController());
  }
}
