import 'package:get/get.dart';
import 'package:mobilegarage/app/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => SearchScreenController(),
    );
  }
}
