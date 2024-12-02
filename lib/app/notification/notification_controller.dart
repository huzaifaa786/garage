import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationController extends GetxController {
  static NotificationController instanse = Get.find();
  int activestatus = 2;

  List<Map<String, dynamic>> notifications = [
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "status": 'neworder'
    },
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
              textStyle: TextStyle(
                  color: activestatus != 1
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: activestatus != 1
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
              "Delivered",
              textStyle: TextStyle(
                  color: activestatus == 2
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: activestatus == 2
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
