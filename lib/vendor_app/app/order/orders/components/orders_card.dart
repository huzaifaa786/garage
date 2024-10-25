// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/models/order_models/orders_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/button.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/items_card.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/components/location.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class OrdersCard extends StatelessWidget {
  OrdersCard({
    super.key,
    required this.order,
  });
  OrdersModel order;

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/calendar.svg'),
                            Gap(5),
                            AppText(
                              title: controller
                                  .formatDate(order.createdAt.toString()),
                              color: AppColors.primary_color,
                              size: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/clock.svg'),
                        Gap(5),
                        AppText(
                          title:
                              controller.formatTime(order.createdAt.toString()),
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
                      title: order.id.toString(),
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
                            // child: CachedNetworkImage(
                            //   imageUrl: controller.image?.isEmpty ?? true
                            //       ? img
                            //       : controller.image.toString(),
                            //   placeholder: (context, url) =>
                            //       CircularProgressIndicator(),
                            //   errorWidget: (context, url, error) =>
                            //       Icon(Icons.error),
                            //   fit: BoxFit.cover,
                            // ),
                            child: AppNetworkImage(
                              assetPath: 'assets/images/boy.png',
                              // width: double.infinity,
                              // height: 80,
                            ),
                          ),
                        ),
                        Gap(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: order.user!.name.toString(),
                              size: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            AppText(
                              title: order.user!.phone.toString(),
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
                            onTap: () {
                              Get.toNamed(AppRoutes.chatScreen);
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightPink),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  fit: BoxFit.scaleDown,
                                  height: 20.0,
                                  width: 18.0,
                                  color: AppColors.darkprimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.makePhoneCall(
                            order.user!.phone.toString(),
                          ),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.lightPink),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'assets/images/call.svg',
                                fit: BoxFit.scaleDown,
                                height: 20.0,
                                width: 18.0,
                                color: AppColors.darkprimary,
                              ),
                            ),
                          ),
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
                            child: AppNetworkImage(
                              assetPath: order
                                  .orderItems![0].userVehicles!.image
                                  .toString(),
                            )),
                      ),
                      Gap(12),
                      SvgPicture.asset(
                        'assets/icons/vehicle.svg',
                        color: AppColors.primary_color,
                      ),
                      Gap(6),
                      AppText(
                        title: order.orderItems![0].userVehicles!.vehicle_info
                            .toString(),
                        size: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary_color,
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: order.orderItems!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final orders = order.orderItems;
                      return Column(
                        children: [
                          ItemsCard(item: order),
                          const Gap(20),
                        ],
                      );
                    }),
                Gap(10),
                Container(
                  height: 60,
                  width: Get.width * 0.8,
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
                        text: order.user!.lat.toString(),
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
                          )
                        : Gap(1),
                Gap(12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
