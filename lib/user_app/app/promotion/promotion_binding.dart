import 'package:get/get.dart';

import 'package:mobilegarage/user_app/app/promotion/promotion_controller.dart';

class PromotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromotionController());
  }
}
