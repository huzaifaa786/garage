import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/aboutus/aboutus_controller.dart';

class AboutusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutusController());
  }
}
