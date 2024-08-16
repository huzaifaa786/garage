import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/profile/changepassword/changepassword_controller.dart';

class VChangepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VChangepasswordController());
  }
}