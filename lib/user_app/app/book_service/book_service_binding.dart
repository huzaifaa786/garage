import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/book_service/book_service_controller.dart';

class BookServiceBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BookServiceController());
  }
}
