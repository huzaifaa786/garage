import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/auth/change_forgot_password/change_forgot_password_controller.dart';

class VChangeForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VChangeForgotPasswordController());
  }
}
