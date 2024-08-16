import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/my_cars/my_cars_controllers.dart';

class MyCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCarsControllers());
  }
}
