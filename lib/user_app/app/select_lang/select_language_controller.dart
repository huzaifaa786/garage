import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';

class SelectLanguageController extends GetxController {
  static SelectLanguageController instanse = Get.find();
  translateMethod? site;

  togglePlan(translateMethod value) {
    site = value;
    update();
  }
}
