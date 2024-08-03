import 'package:get/get.dart';
import 'package:mobilegarage/app/auth/signin/signin_controller.dart';

class SigninBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => SigninController(),
    );
  }
}
