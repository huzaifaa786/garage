import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/terms/terms_conditions_controller.dart';

class TermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsConditionsController());
  }
}
