import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/profile/owner_id/owner_id_controller.dart';

class OwnerIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OwnerIdController(),
    );
  }
}
