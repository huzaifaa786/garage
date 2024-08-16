import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/avaliabledate_controller.dart';

class AvaliableDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvaliableDateController());
  }
}