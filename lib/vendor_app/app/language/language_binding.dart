import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/language/language_controller.dart';


class VLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VLanguageController());
  }
}
