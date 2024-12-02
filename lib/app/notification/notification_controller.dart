import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/notification_apis/get_notification_api.dart';
import 'package:mobilegarage/apis/user_apis/notification_apis/notification_seen_api.dart';
import 'package:mobilegarage/models/notifications_model.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationController extends GetxController {
  static NotificationController instanse = Get.find();
  // int? activestatus;

  List<NotificationsModel> notifications = [];
  getNotification() async {
    var response = await GetNotificationApi.getNotification();
    if (response.isNotEmpty &&
        response['success'] != null &&
      response['success']['data'] != null &&
      response['success']['data'] is List<dynamic>) {
      notifications = (response['success']['data'] as List<dynamic>)
          .map((item) => NotificationsModel.fromJson(item))
          .toList();
      // for (var notification in notifications) {
      //   if (notification.order?.status == "PENDING") {
      //     activestatus = 1;
      //   } else if (notification.order?.status == "ACCEPTED") {
      //     activestatus = 2;
      //   } else if (notification.order?.status == "ON_THE_WAY") {
      //     activestatus = 3;
      //   } else {
      //     activestatus = 4;
      //   }
      // }
      update();
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getNotification();
   await seenNotification();
  }

  seenNotification() async {
    var response = await UserNotificationSeenApi.seenNotification();
    update();
  }

  List<StepperData> getstepperData(String status) => [
        StepperData(
            title: StepperText(
              "Accepted".tr,
              textStyle: const TextStyle(
                  color: AppColors.lightgreen,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: AppColors.lightgreen,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
        StepperData(
            title: StepperText(
              "On the way".tr,
              textStyle: TextStyle(
                  color: status == 'ON_THE_WAY' || status == 'DELIVERED'
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: status == 'ON_THE_WAY' || status == 'DELIVERED'
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
        StepperData(
            title: StepperText(
              "Delivered".tr,
              textStyle: TextStyle(
                  color: status == 'DELIVERED'
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: status == 'DELIVERED'
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
      ];
}
