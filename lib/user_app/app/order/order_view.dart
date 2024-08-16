// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/order/components/circle.dart';
import 'package:mobilegarage/user_app/app/order/components/line.dart';
import 'package:mobilegarage/user_app/app/order/order_controller.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/shadows/appbar_shadow.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

int activeStep = 0;

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(95.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [appbarShadow],
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    scrolledUnderElevation: 0.0,
                    toolbarHeight: 95.0,
                    title: TopBar(
                      showicon: true,
                      title: 'Find Service',
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Gap(30),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       height: Get.height * 0.05,
                      //       width: Get.width * 0.45,
                      //       child: AppText(
                      //         title: 'What service do you need?',
                      //         size: 16,
                      //         fontWeight: FontWeight.w600,
                      //         color: AppColors.darkprimary,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Gap(30),
                      // MainInput(
                      //   hint: 'I need..',
                      //   controller: controller.serviceController,
                      //   errorText: '',
                      // ),
                      // Gap(15),
                      // PriceInput(
                      //   hint: 'Price',
                      //   controller: controller.priceController,
                      //   errorText: '',
                      // ),
                      // Gap(15),
                      // DottedBorderButton(
                      //   title: 'Upload service or product image'.tr,
                      //   imgselect: () => controller.selectVehicleImage(),
                      //   isImgSelected: controller.isImageSelected(),
                      // ),
                      // Gap(25),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       'assets/icons/stop-circle.svg',
                      //       height: 20,
                      //       width: 20,
                      //     ),
                      //     Gap(10),
                      //     AppText(
                      //       title: 'Choose service category',
                      //       size: 12,
                      //       fontWeight: FontWeight.w600,
                      //       // color: AppColors.darkprimary,
                      //     ),
                      //   ],
                      // ),
                      // Gap(25),
                      // SizedBox(
                      //   height: Get.height * 0.12,
                      //   child: ListView.builder(
                      //     itemCount: controller.itemCount,
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder: (context, index) {
                      //       controller.services.length;
                      //       final item = controller.services[index];
                      //       return ServicesIcons(
                      //         imageUrl: item.imageUrl,
                      //         text: item.text,
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Gap(25),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset(
                      //       'assets/icons/vehicle.svg',
                      //       height: 16,
                      //       width: 19,
                      //     ),
                      //     Gap(10),
                      //     AppText(
                      //       title: 'Choose your vehicle',
                      //       size: 12,
                      //       fontWeight: FontWeight.w600,
                      //       // color: AppColors.darkprimary,
                      //     ),
                      //   ],
                      // ),
                      // Gap(10),
                      // SingleChildScrollView(
                      //   child: SizedBox(
                      //     height: controller.listHeight,
                      //     child: ListView.builder(
                      //       physics: NeverScrollableScrollPhysics(),
                      //       itemCount: controller.items.length,
                      //       itemBuilder: (context, index) {
                      //         final item = controller.items[index];
                      //         return VehicleListTile(
                      //           value: item['id']!,
                      //           groupValue: controller.selectedValue.toString(),
                      //           onChanged: (value) {
                      //             controller.selectedValue = value;
                      //             controller.update();
                      //           },
                      //           iconPath: 'assets/icons/vehicle.svg',
                      //           text: item['text']!,
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                      // Row(children: [
                      //   SvgPicture.asset(
                      //     'assets/icons/map_pin.svg',
                      //     height: 15,
                      //     width: 15,
                      //   ),
                      //   Gap(10),
                      //   AppText(
                      //     title: 'Select location',
                      //     size: 12,
                      //     fontWeight: FontWeight.w600,
                      //     // color: AppColors.darkprimary,
                      //   ),
                      // ]),
                      // Gap(20),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       child: Image.asset(
                      //         'assets/images/map_image.png',
                      //       ),
                      //     ),
                      //     Positioned(
                      //       left: Get.width * 0.1,
                      //       right: Get.width * 0.1,
                      //       top: Get.height * 0.12,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         children: [
                      //           AllProfileCard(
                      //             height: Get.height * 0.06,
                      //             width: Get.width * 0.9,
                      //             text: 'Dubai',
                      //             image: 'assets/icons/map_pin.svg',
                      //             text2: 'zayed street , house3564 ,....',
                      //             ontap: () {},
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Gap(60),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     MainButton(
                      //       buttonWidth: Get.width * 0.3,
                      //       height: Get.width * 0.13,
                      //       title: 'Cancel',
                      //       btncolor: AppColors.lightprimary,
                      //       textcolor: AppColors.primarybg,
                      //       onTap: () {},
                      //     ),
                      //     MainButton(
                      //       buttonWidth: Get.width * 0.45,
                      //       height: Get.width * 0.13,
                      //       title: 'Confirm',
                      //       onTap: () {},
                      //     ),
                      //   ],
                      // ),
                      Gap(50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: Timeline.tileBuilder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            theme: TimelineThemeData.vertical(),
                            builder: TimelineTileBuilder.fromStyle(
                              contentsAlign: ContentsAlign.basic,
                              indicatorStyle: IndicatorStyle.dot,
                              contentsBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Text('Timeline Event $index'),
                              ),
                              itemCount: 5,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Gap(10),
                              Circle(),
                              Line(),
                              Circle(),
                              Line(),
                              Circle(),
                              Line(),
                              Circle(),
                              Line(),
                              Circle(),
                            ],
                          ),
                          Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //! Filter By

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightprimary,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/filter.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Gap(10),
                                  AppText(
                                    title: 'Filter By',
                                    fontWeight: FontWeight.w600,
                                    size: 16.0,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                              Gap(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Gap(18),
                                  AppText(
                                    title: 'Approximate price '.tr,
                                    fontWeight: FontWeight.w400,
                                    size: 10.0,
                                    color: AppColors.grey,
                                  ),
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: Get.width * 0.35),
                                        child: AppText(
                                          title: '123.444444',
                                          fontWeight: FontWeight.w600,
                                          size: 13.0,
                                          color: AppColors.primarybg,
                                          overFlow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      AppText(
                                        title: ' AED'.tr,
                                        fontWeight: FontWeight.w600,
                                        size: 13.0,
                                        color: AppColors.primarybg,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              //! All Brands
                              Container(
                                height: Get.height * 0.052,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Gap(18),
                                      AppText(
                                        title: 'All brands'.tr,
                                        fontWeight: FontWeight.w600,
                                        size: 12.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ));
  }
}
