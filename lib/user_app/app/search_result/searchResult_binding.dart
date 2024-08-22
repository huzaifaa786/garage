import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_controller.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => SearchResultController(),
    );
  }
}
