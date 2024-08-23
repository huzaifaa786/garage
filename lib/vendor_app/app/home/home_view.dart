// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/app/home/components/edit_button.dart';
import 'package:mobilegarage/vendor_app/app/home/components/home_appbar.dart';
import 'package:mobilegarage/vendor_app/app/home/components/main_box.dart';
import 'package:mobilegarage/vendor_app/app/home/components/review_box.dart';
import 'package:mobilegarage/vendor_app/app/home/components/reviewcard.dart';
import 'package:mobilegarage/vendor_app/app/home/components/switch_button.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';
import 'package:mobilegarage/vendor_app/app/product/products/component/button.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VHomeView extends StatefulWidget {
  const VHomeView({super.key});

  @override
  State<VHomeView> createState() => _VHomeViewState();
}

class _VHomeViewState extends State<VHomeView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VHomeController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 223, 223),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: HomeAppbar(
            chat: () {
              Get.toNamed(AppRoutes.vchat);
            },
            notification: () {
              Get.toNamed(AppRoutes.vnotification);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                height: Get.height * 0.45,
                decoration: BoxDecoration(color: AppColors.white_color),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 29),
                          child: Image.asset(
                            'assets/images/Rectangle 201.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.223,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 135,
                            left: (MediaQuery.of(context).size.width - 100) / 2,
                            child: Image.asset(
                              'assets/images/Ellipse 127.png',
                              width: 100,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Street garage',
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary_color,
                        ),
                        SvgPicture.asset('assets/images/Vector (20).svg')
                      ],
                    ),
                    Gap(8),
                    AppText(
                      title: 'All cars services and products.',
                      size: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => TextSwitchButton(
                                value: controller.status.value,
                                ontoggle: controller.toggleStatus,
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EdittButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.vavaliabledate);
                          },
                          icon: 'assets/images/calendar.svg',
                          text: 'Edit unavailable dates ',
                          width: MediaQuery.of(context).size.width * 0.42,
                        ),
                        Gap(10),
                        EditButton(
                          ontap: () {
                            Get.toNamed(AppRoutes.veditprofile);
                          },
                          icon: 'assets/images/edit.svg',
                          text: 'Edit profit',
                          width: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(8),
              Container(
                decoration: BoxDecoration(color: AppColors.white_color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MainBox(
                          ontap: () {
                            Get.toNamed(AppRoutes.vbanner);
                          },
                        icon: 'assets/images/pluscircle.svg',
                        text: 'Promotional\n   banners',
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainBox(
                             ontap: () {
                            Get.toNamed(AppRoutes.vproduct_form_view);
                          },
                            icon: 'assets/images/Group 51.svg',
                            text: 'Add product\n or service',
                          ),
                          Gap(27),
                          MainBox(
                              ontap: () {
                            Get.toNamed(AppRoutes.vproductlist);
                          },
                            icon: 'assets/images/Group 53.svg',
                            text: 'Edit product &\n services',
                          )
                        ],
                      ),
                      Gap(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainBox(
                              ontap: () {
                            Get.toNamed(AppRoutes.vorders_view);
                          },
                            icon: 'assets/images/shopping-bag.svg',
                            text: 'Orders',
                          ),
                          Gap(27),
                          MainBox(
                            icon: 'assets/images/Group 500.svg',
                            text: 'Sales',
                              ontap: () {
                            Get.toNamed(AppRoutes.vsale);
                          },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ReviewBox(
                                     ontap: () {
                            Get.toNamed(AppRoutes.vorders_view);
                          },
                                  icon: 'assets/images/quick-check 1.png',
                                  text: 'Instant Order',
                                ),
                                ReviewBox(
                                  icon: 'assets/images/star.png',
                                  text: 'My reviews',
                                  ontap: () => _openReviewBottomSheet(context),
                                ),
                                ReviewBox(
                                   ontap: () {
                            Get.toNamed(AppRoutes.vcontactus);
                          },
                                  icon: 'assets/images/phone.png',
                                  text: 'Contact us',
                                ),
                                ReviewBox(
                                  icon: 'assets/images/power.png',
                                  text: 'Log Out',
                                ),
                                Gap(15)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  void _openReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GetBuilder<VHomeController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Divider(
                    color: const Color.fromARGB(255, 209, 208, 208),
                    thickness: 1.0,
                  ),
                  Gap(10),
                  SizedBox(
                    height: Get.height * 0.42,
                    child: ListView.builder(
                      itemCount: controller.review.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.review[index];
                        return Reviewcard(
                          name: 'sfsdfsd',
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
