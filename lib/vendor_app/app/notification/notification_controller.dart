import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/notifications_api/notifications_api.dart';
import 'package:mobilegarage/models/notifications_model.dart';

class VNotificationController extends GetxController {
  static VNotificationController instance = Get.find();
  List<NotificationsModel> notifications = [];

  String? garageId = '';
  @override
  void onInit() {
    super.onInit();
    garageId = Get.parameters['garageId'] ?? '';
    garageNotifications();
  }

  String? image;
  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  garageNotifications() async {
    var response = await VendorNotificationsApi.garageNotifications(garageId);
    if (response.isNotEmpty) {
      notifications = (response['data'] as List<dynamic>)
          .map((item) => NotificationsModel.fromJson(item))
          .toList();
    }
    update();
  }
}
