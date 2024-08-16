import 'package:get/get.dart';

import 'package:mobilegarage/user_app/app/privacy/privacy_controller.dart';


class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyController());
  }
}
