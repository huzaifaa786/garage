import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/signup_controller.dart';

class VSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VSignUpController());
  }
}
