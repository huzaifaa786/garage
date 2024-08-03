import 'package:get/get.dart';
import 'package:mobilegarage/app/auth/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => OtpController(),
    );
  }
}
