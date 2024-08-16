import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationController extends GetxController {
  static NotificationController instanse = Get.find();
  int activestatus = 0;

  List<Map<String, dynamic>> notifications = [
    {"productImage": "https://dummyimage.com/93x93/000/fff", "status": 's'},
  ];
  List<StepperData> get stepperData => [
        StepperData(
            title: StepperText(
              "Accepted",
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
              "On the way",
              textStyle: const TextStyle(
                  color: AppColors.greybg,
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
              "Delivered",
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
      ];
}
