// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/button.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/location.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    this.day,
    this.img = 'https://dummyimage.com/50x47/000/fff',
    this.name,
    this.location,
    this.time,
    this.number,
  });
  final day;
  final number;
  final img;
  final location;
  final name;
  final time;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VOrdersController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          decoration: BoxDecoration(color: AppColors.white_color),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/calendar.svg'),
                        AppText(
                          title: ' ' + 'Wednesday 3 March 2024',
                          color: AppColors.primary_color,
                          size: 11,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg'),
                        AppText(
                          title: ' ' + '12:30 pm',
                          color: AppColors.primary_color,
                          size: 11,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    )
                  ],
                ),
                Gap(12),
                Row(
                  children: [
                    Container(
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary_color,
                      ),
                    ),
                    Gap(13),
                    AppText(
                      title: 'Tracking number:',
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    Gap(13),
                    AppText(
                      title: '453453533',
                      size: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary_color,
                    ),
                  ],
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightblue,
                          ),
                        ),
                        Gap(8),
                        Container(
                          height: 47,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(38),
                            child: CachedNetworkImage(
                              imageUrl: controller.image?.isEmpty ?? true
                                  ? img
                                  : controller.image.toString(),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: '  ' + name,
                              size: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            AppText(
                              title: '  ' + number,
                              size: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/chat.png')),
                        ),
                        GestureDetector(
                           onTap: () => controller.makePhoneCall(
                        controller.phoneNumber ?? '+923154704013',
                      ),
                          child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.light_red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset('assets/images/call.svg'),
                              )),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        height: 47,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(38),
                          child: CachedNetworkImage(
                            imageUrl: controller.image?.isEmpty ?? true
                                ? img
                                : controller.image.toString(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gap(12),
                      SvgPicture.asset('assets/icons/car (1).svg'),
                      Gap(6),
                      AppText(
                        title: 'white Mercedes 2022',
                        size: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary_color,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: controller.image?.isEmpty ?? true
                                ? img
                                : controller.image.toString(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: 'Car washing',
                            size: 11,
                            fontWeight: FontWeight.w500,
                          ),

                          Gap(4),
                          Row(
                            children: [
                              AppText(
                                title: 'Type :',
                                size: 11,
                                fontWeight: FontWeight.w400,
                              ),
                              AppText(
                                title: 'automatic',
                                size: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          // Gap(3),
                          // Row(
                          //   children: [
                          //     AppText(
                          //       title: 'Time :',
                          //       size: 10,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     AppText(
                          //       title: '4: 34',
                          //       size: 9,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ],
                          // ),
                          Gap(4),
                          AppText(
                            title: 'Total ' + '343435' + ' AED',
                            size: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightblue,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Gap(10),
                Container(
                  height: 60,
                  width: Get.width*0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.vmap);
                      },
                      child: Locationn(
                        text: 'fgfdgdfdfsdfsdfsdfsdfsdfsdfsdfsgdfgdfgdfgd',
                      ),
                    ),
                  ),
                ),
                Gap(12),
                controller.selectedIndex == 0
                    ? controller.selectedSubIndex == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AcceptedButton(
                                color: AppColors.primary_color,
                                text: 'Reject',
                                width: Get.width * 0.3,
                              ),
                              AcceptedButton(
                                color: AppColors.green_color,
                                text: 'Accept',
                                width: Get.width * 0.3,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AcceptedButton(
                                color: AppColors.primary_color,
                                text: 'Reject',
                                width: Get.width * 0.3,
                              ),
                              AcceptedButton(
                                color: AppColors.lightblue,
                                text: 'Mark as delivered',
                                width: Get.width * 0.5,
                              )
                            ],
                          )
                    : controller.selectedIndex == 1
                    ? AcceptedButton(
                        color: AppColors.lightblue,
                        text: 'Mark as delivered',
                        width: Get.width * 0.5,
                      ) :Gap(1),
                Gap(12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
