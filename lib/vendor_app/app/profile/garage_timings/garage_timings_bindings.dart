import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/profile/garage_timings/garage_timings_controller.dart';

class GarageTimingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GarageTimingsController());
  }
}
