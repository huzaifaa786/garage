import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_controller.dart';

class VNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VNotificationController());
  }
}