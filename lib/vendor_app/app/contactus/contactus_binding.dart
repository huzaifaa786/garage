import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/contactus/contactus_controller.dart';


class VContactusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VContactusController());
  }
}