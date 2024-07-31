import 'package:get/get.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
