import 'package:get/get.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_controller.dart';
import 'package:mobilegarage/app/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
