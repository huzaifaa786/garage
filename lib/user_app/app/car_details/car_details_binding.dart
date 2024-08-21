import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/car_details/car_details_controller.dart';

class CarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>CarDetailsController());
  }

}