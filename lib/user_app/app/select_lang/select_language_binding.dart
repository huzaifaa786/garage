import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/select_lang/select_language_controller.dart';

class SelectLanguageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SelectLanguageController(),);
  }
}