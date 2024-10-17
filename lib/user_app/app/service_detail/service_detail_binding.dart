import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/service_detail/service_detail_controller.dart';

class ServiceDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ServiceDetailController(),);
  }
}