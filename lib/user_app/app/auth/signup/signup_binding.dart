import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/auth/signup/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupController(),
    );
  }
}
