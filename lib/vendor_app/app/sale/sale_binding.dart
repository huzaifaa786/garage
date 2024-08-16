import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/sale/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleController());
  }
}