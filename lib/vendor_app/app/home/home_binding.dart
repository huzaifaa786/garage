import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';

class VHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VHomeController());
  }
}