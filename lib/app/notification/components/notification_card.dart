// ignore_for_file: prefer_const_constructors

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/notification/notification_controller.dart';
import 'package:mobilegarage/models/notifications_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    super.key,
    this.status,
    this.notification,
  });
  NotificationsModel? notification;

  int getActiveIndex(String status) {
    switch (status) {
      case 'PENDING':
        return -1;
      case 'ACCEPTED':
        return 0;
      case 'ON_THE_WAY':
        return 1;
      case 'DELIVERED':
        return 2;
      default:
        return 0;
    }
  }

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
                              status == 'PENDING'
                                  ? SvgPicture.asset(
                                      'assets/icons/order_accepted.svg',
                                      height: 30,
                                      width: 30,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: AppNetworkImage(
                                        networkImage:
                                            notification!.order != null
                                                ? notification!
                                                    .order!.garage!.banner
                                                    .toString()
                                                : notification!.requestOrder!
                                                    .garage!.banner
                                                    .toString(),
                                        assetPath:
                                            'assets/images/street_garage.png',
                                      ),
                                    ),
                              Gap(10),
                              AppText(
                                title: status == 'PENDING'
                                    ? 'Congratulation!'.tr
                                    : notification!.order != null
                                        ? notification!.order!.garage!.name
                                            .toString()
                                        : notification!
                                            .requestOrder!.garage!.name
                                            .toString(),
                                size: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primarybg,
                              ),
                            ],
                          ),
                          if (status != 'PENDING' ||
                              notification!.order != null ||
                              notification!.requestOrder != null)
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(AppRoutes.chats_accounts);
                                Get.to(() => ChatScreenView(
                                    id: notification!.order != null
                                        ? notification!.order!.garage!.id
                                            .toString()
                                        : notification!.requestOrder!.garage!.id
                                            .toString(),
                                    name: notification!.order != null
                                        ? notification!.order!.garage!.name
                                            .toString()
                                        : notification!
                                            .requestOrder!.garage!.name
                                            .toString(),
                                    profilePic: '',
                                    screen: 'chat'));
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: AppColors.lightPink,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  color: AppColors.darkprimary,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Gap(16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: AuthRichText(
                        title: status == 'ACCEPTED'
                            ? 'Has been accepted your order!'.tr
                            : status == 'ON_THE_WAY'
                                ? 'Your order is on the way'.tr
                                : status == 'DELIVERED'
                                    ? 'Your order has been delivered'.tr
                                    : status == 'REJECTED'
                                        ? 'Your order has been Rejected'.tr
                                        : '',
                        description: status == 'ACCEPTED' ? 'View_order'.tr : '',
                        titlesize: 12,
                        descriptiosize: 12,
                        titleColor: AppColors.black,
                        titlefontweight: FontWeight.w400,
                        descriptionColor: AppColors.darkblue,
                        descriptionfontweight: FontWeight.w500,
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.acceptedorder,
                            parameters: {'path': 'notification'},
                          );
                        },
                      ),
                    ),
                    if ( status != 'REJECTED')
                    // if (status != 'PENDING' || status != 'REJECTED')

                      Column(
                        children: [
                          Gap(20),
                          SizedBox(
                            width: Get.width,
                            child: AnotherStepper(
                              stepperList: controller.getstepperData(status),
                              stepperDirection: Axis.horizontal,
                              iconWidth: 30,
                              iconHeight: 30,
                              activeBarColor: AppColors.lightgreen,
                              inActiveBarColor: Colors.grey,
                              inverted: true,
                              verticalGap: 20,
                              activeIndex: getActiveIndex(status),
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
