import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_controller.dart';

class FilterServiceBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FilterServiceController());
  }
}
