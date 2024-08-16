import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_controller.dart';


class VBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VBannerController());
  }
}