import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_password_controller.dart';

class VForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VForgotPasswordController());
  }
}
