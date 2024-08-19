import 'package:get/get.dart';
import 'package:mobilegarage/selectside/selectside_controller.dart';

class SelectsideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectSideController());
  }
}