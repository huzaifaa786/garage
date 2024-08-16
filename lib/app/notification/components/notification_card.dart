// ignore_for_file: prefer_const_constructors

import 'package:another_stepper/another_stepper.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/notification/notification_controller.dart';
import 'package:mobilegarage/app/order/order_view.dart';
import 'package:mobilegarage/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: Get.width,
                // height: 700,
                color: AppColors.white,
                child: Column(
                  children: [
                    Gap(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.darkblue),
                          ),
                          Gap(15),
                          SvgPicture.asset(
                            'assets/icons/order_accepted.svg',
                            height: 30,
                            width: 30,
                          ),
                          Gap(10),
                          AppText(
                            title: 'Congratulation!',
                            size: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primarybg,
                          ),
                        ],
                      ),
                    ),
                    Gap(6),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: AuthRichText(
                        title:
                            'There are garages were accepted your order,\n please click to view them.',
                        description: 'View',
                        titlesize: 12,
                        descriptiosize: 12,
                        titleColor: AppColors.black,
                        titlefontweight: FontWeight.w400,
                        descriptionColor: AppColors.darkblue,
                        descriptionfontweight: FontWeight.w500,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: AnotherStepper(
                        stepperList: controller.stepperData,
                        stepperDirection: Axis.horizontal,
                        iconWidth: 30,
                        iconHeight: 30,
                        activeBarColor: AppColors.lightgreen,
                        inActiveBarColor: Colors.grey,
                        inverted: true,
                        verticalGap: 20,
                        activeIndex: controller.activestatus,
                        barThickness: 8,
                        
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
