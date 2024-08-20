import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/payment/payment_controller.dart';

class PaymentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentsController());
  }
}