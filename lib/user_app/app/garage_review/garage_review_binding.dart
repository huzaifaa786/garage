import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/garage/garage_controller.dart';

class GarageReviewBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GarageController(),);
  }
}