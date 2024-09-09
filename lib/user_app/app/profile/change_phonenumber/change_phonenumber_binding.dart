import 'package:get/get.dart';

import 'package:mobilegarage/user_app/app/profile/change_phonenumber/change_phonenumber_controller.dart';


class ChangePhonenumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePhonenumberController());
  }
}
