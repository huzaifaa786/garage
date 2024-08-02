import 'package:get/get.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/app/profile/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
