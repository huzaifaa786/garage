// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/home/components/edit_button.dart';
import 'package:mobilegarage/vendor_app/app/home/components/home_appbar.dart';
import 'package:mobilegarage/vendor_app/app/home/components/main_box.dart';
import 'package:mobilegarage/vendor_app/app/home/components/review_box.dart';
import 'package:mobilegarage/vendor_app/app/home/components/reviewcard.dart';
import 'package:mobilegarage/vendor_app/app/home/components/switch_button.dart';
import 'package:mobilegarage/vendor_app/app/home/home_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/rating_alertdialog/rating_alertdialog.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

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
              toolbarHeight: 70,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              title: HomeAppbar(
                chat: () {
                  Get.toNamed(AppRoutes.vchat);
                },
                notification: () {
                  Get.toNamed(AppRoutes.vnotification, parameters: {
                    'garageId': controller.garage!.id.toString(),
                  });
                },
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.white_color),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 29),
                              child: CachedNetworkImage(
                                imageUrl: controller.garage != null
                                    ? controller.garage!.banner!
                                    : 'https://dummyimage.com/60x40/000/fff',
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.235,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 8,
                                left:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImage(
                                    imageUrl: controller.garage != null
                                        ? controller.garage!.logo!
                                        : 'https://dummyimage.com/60x40/000/fff',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              title: controller.garage != null
                                  ? controller.garage!.name!
                                  : "street garage",
                              size: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary_color,
                            ),
                            Gap(4),
                            SvgPicture.asset('assets/images/Vector (20).svg')
                          ],
                        ),
                        Gap(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: AppText(
                            title: controller.garage != null
                                ? controller.garage!.description!
                                : 'description',
                            size: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        controller.garage != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextSwitchButton(
                                      value: controller.isSelected!,
                                      ontoggle: (value) {
                                        controller.toggleStatus(value);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : Gap(0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EditButton(
                              ontap: () {
                                Get.toNamed(AppRoutes.vunavaliabledate);
                              },
                              icon: 'assets/images/calendar.svg',
                              text: 'Edit unavailable dates',
                            ),
                            Gap(10),
                            EditButton(
                              ontap: () {
                                Get.toNamed(AppRoutes.veditprofile)!
                                    .then((onValue) {
                                  controller.garagedata();
                                });
                              },
                              icon: 'assets/icons/edit.svg',
                              text: 'Edit profile',
                            ),
                          ],
                        ),
                        Gap(20),
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
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReviewBox(
                                    ontap: () {
                                      Get.toNamed(
                                          AppRoutes.vurgent_orders_view);
                                    },
                                    icon: 'assets/images/quick-check 1.png',
                                    text: 'Urgent Orders',
                                  ),
                                  ReviewBox(
                                    icon: 'assets/images/star.png',
                                    text: 'My reviews',
                                    ontap: () =>
                                        _openReviewBottomSheet(context),
                                  ),
                                  ReviewBox(
                                    ontap: () {
                                      Get.toNamed(AppRoutes.vcontactus);
                                    },
                                    icon: 'assets/images/phone.png',
                                    text: 'Contact us',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RatingAlertDialog(
                                            garagetitle: 'Street garage',
                                          );
                                        },
                                      );
                                    },
                                    child: ReviewBox(
                                      icon: 'assets/images/power.png',
                                      text: 'Log Out',
                                      ontap: () async {
                                        UiUtilites.showConfirmationDialog(
                                          false,
                                          'Are you Sure that you want\n to log out ?',
                                          onConfirm: () async {
                                            GetStorage box = GetStorage();
                                            await box.remove('api_token');
                                            await box.remove('user_type');

                                            controller.update();
                                            Get.offAllNamed(
                                                AppRoutes.selectside);
                                          },
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ]),
              ),
            )));
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
                      itemCount: controller.garageReviews!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.garageReviews![index];
                        return Reviewcard(
                          reviews: item,
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
