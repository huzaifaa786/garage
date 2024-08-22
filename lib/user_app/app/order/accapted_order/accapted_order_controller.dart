import 'package:get/get.dart';

class AccaptedOrderController extends GetxController {
  static AccaptedOrderController instance = Get.find();
  bool isSelected = false;
  void toggleSelection() {
    isSelected = !isSelected;
    update();
  }

  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }
}
