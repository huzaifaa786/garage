import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/map/map_controller.dart';

class VMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VMapController());
  }
}
