import 'package:get/get.dart';

class AccaptedOrderController extends GetxController {
  static AccaptedOrderController instance = Get.find();
  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }
}