import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';

class SelectSideController extends GetxController {
  static SelectSideController instance = Get.find();
  translateMethod? site;

  toggleplan(translateMethod value) {
    site = value;
    update();
  }

  @override
  void onInit() {
    GetStorage box = GetStorage();
    site = box.read('locale') == 'ar'
        ? translateMethod.Arabic
        : translateMethod.English;
    update();
    super.onInit();
  }
}
