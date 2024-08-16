import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/editprofile_controller.dart';

class VEditprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VEditprofileController());
  }
}