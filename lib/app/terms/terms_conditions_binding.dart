import 'package:get/get.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/app/terms/terms_conditions_controller.dart';

class TermsConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsConditionsController());
  }
}
