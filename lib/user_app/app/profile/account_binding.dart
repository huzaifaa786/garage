import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/profile/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
