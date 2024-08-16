import 'package:get/get.dart';
import 'package:mobilegarage/app/FAQ/faq_controller.dart';
import 'package:mobilegarage/app/aboutus/aboutus_controller.dart';
import 'package:mobilegarage/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/app/privacy/privacy_controller.dart';
import 'package:mobilegarage/app/profile/account_controller.dart';
import 'package:mobilegarage/app/promotion/promotion_controller.dart';
import 'package:mobilegarage/app/terms/terms_conditions_controller.dart';

class PromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionController());
  }
}
