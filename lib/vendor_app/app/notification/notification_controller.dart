import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/notifications_api/garage_notification_seen_api.dart';
import 'package:mobilegarage/apis/vender_apis/notifications_api/notifications_api.dart';
import 'package:mobilegarage/models/notifications_model.dart';

class VNotificationController extends GetxController {
  static VNotificationController instance = Get.find();
  List<NotificationsModel> notifications = [];

  String? garageId = '';
  @override
  void onInit() async {
    super.onInit();
    garageId = Get.parameters['garageId'] ?? '';
    await garageNotifications();
    await seenNotification();
  }

  seenNotification() async {
    var response = await GarageNotificationSeenApi.seenNotification();
    update();
  }

  String? image;
  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  garageNotifications() async {
    var response = await VendorNotificationsApi.garageNotifications(garageId);
    if (response['data'] != null && response['data'] is List<dynamic>) {
      notifications = (response['data'] as List<dynamic>)
          .map((item) => NotificationsModel.fromJson(item))
          .toList();
    }
    update();
  }

  //!  Time Format
  String timeAgo(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);

    final now = DateTime.now();

    final difference = now.difference(dateTime);

    if (difference.inDays >= 1) {
      return difference.inDays == 1
          ? '1 day ago'.tr
          : '${difference.inDays} ${'days ago'.tr}';
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1
          ? '1 hour ago'.tr
          : '${difference.inHours} ${'hours ago'.tr}';
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1
          ? '1 minute ago'.tr
          : '${difference.inMinutes} ${'minutes ago'.tr}';
    } else if (difference.inSeconds >= 1) {
      return difference.inSeconds == 1
          ? '1 second ago'.tr
          : '${difference.inSeconds} ${'seconds ago'.tr}';
    } else {
      return '${'Just now'.tr}';
    }
  }
}
