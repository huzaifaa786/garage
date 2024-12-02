import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/profile/trading_license/trading_license_controller.dart';

class TradingLicenseBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => TradingLicenseController(),
    );
  }
}
