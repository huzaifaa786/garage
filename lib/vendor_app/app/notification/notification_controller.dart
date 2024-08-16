import 'package:get/get.dart';

class VNotificationController extends GetxController {
  static VNotificationController instance = Get.find();
  String? image;
    double ratings = 0.0;
void updateRating(double rating) {
    ratings = rating;
    update();
  }

}