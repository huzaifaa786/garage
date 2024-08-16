import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/signin_controller.dart';

class VSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VSignInController());
  }
}
