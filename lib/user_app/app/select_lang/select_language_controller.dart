import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';

class SelectLanguageController extends GetxController {
  static SelectLanguageController instanse = Get.find();
  translateMethod? site;

  toggleplan(translateMethod value) {
    site = value;
    update();
  }
}
