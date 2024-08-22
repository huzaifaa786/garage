import 'package:get/get.dart';

class SearchResultController extends GetxController {
  static SearchResultController instance = Get.find();
  // File? cover;

  var selectedValue = 1;

  void updateSelectedValue(int newValue) {
    selectedValue = newValue;
    update();
    
  }

}
