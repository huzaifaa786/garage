import 'package:get/get.dart';
import 'package:mobilegarage/app/FAQ/faq_controller.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/app/terms/terms_conditions_controller.dart';

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaqController());
  }
}
