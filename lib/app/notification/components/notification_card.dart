// ignore_for_file: prefer_const_constructors

import 'package:another_stepper/another_stepper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/notification/notification_controller.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, this.status = 'neworders'});
  final status;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: Get.width,
                color: AppColors.white,
                child: Column(
                  children: [
                    Gap(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.darkblue),
                              ),
                              Gap(15),
                              status == 'neworder'
                                  ? SvgPicture.asset(
                                      'assets/icons/order_accepted.svg',
                                      height: 30,
                                      width: 30,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: AppNetworkImage(
                                        assetPath:
                                            'assets/images/street_garage.png',
                                      ),
                                      // child: CachedNetworkImage(
                                      //   imageUrl:
                                      //       'https://dummyimage.com/93x93/000/fff',
                                      //   height: 35,
                                      //   width: 35,
                                      // ),
                                    ),
                              Gap(10),
                              AppText(
                                title: status == 'neworder'
                                    ? 'Congratulation!'
                                    : 'Street garage',
                                size: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primarybg,
                              ),
                            ],
                          ),
                          if (status != 'neworder')
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: AppColors.lightPink,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Image.asset('assets/images/chat.png'),
                            ),
                        ],
                      ),
                    ),
                    Gap(16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: AuthRichText(
                        title: 'Has been accepted your order!',
                        description: 'View_order',
                        titlesize: 12,
                        descriptiosize: 12,
                        titleColor: AppColors.black,
                        titlefontweight: FontWeight.w400,
                        descriptionColor: AppColors.darkblue,
                        descriptionfontweight: FontWeight.w500,
                        onTap: () {},
                      ),
                    ),
                    if (status != 'neworder')
                      Column(
                        children: [
                          Gap(20),
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
                    Gap(20),
                  ],
                ),
              ),
            ));
  }
}
