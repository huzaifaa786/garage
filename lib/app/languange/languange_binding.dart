import 'package:get/get.dart';
import 'package:mobilegarage/app/languange/languange_controller.dart';
import 'package:mobilegarage/app/select_lang/select_language_controller.dart';

class LanguangeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LanguagesController(),);
  }
}