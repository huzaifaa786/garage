import 'package:get/get.dart';

import 'package:mobilegarage/user_app/app/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
