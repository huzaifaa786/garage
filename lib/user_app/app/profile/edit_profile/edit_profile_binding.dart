import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/profile/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
