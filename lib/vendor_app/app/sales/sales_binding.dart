import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/sales/sales_controller.dart';

class SalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SalesController());
  }
}
