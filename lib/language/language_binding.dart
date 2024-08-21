import 'package:get/get.dart';
import 'package:mobilegarage/language/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }
}