import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/FAQ/faq_controller.dart';


class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
