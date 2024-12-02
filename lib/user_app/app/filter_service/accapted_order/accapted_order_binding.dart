import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';

class AccaptedOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterServiceController());
  }
}
