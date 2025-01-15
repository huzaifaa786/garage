// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/app/garage/components/selected_product_card.dart';
import 'package:mobilegarage/user_app/app/garage/garage_controller.dart';
import 'package:mobilegarage/user_app/app/garage_review/garage_review_view.dart';
import 'package:mobilegarage/user_app/app/home/components/service_icons.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class GarageView extends StatelessWidget {
  const GarageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageController>(
      builder: (controller) => controller.garage != null
          ? Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0.0,
                  toolbarHeight: 80,
                  title: TopBar(
                    title: controller.garage!.name.toString(),
                  )),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                          alignment: Alignment.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            AppNetworkImage(
                              networkImage:
                                  controller.garage!.banner.toString(),
                              width: Get.width,
                              fit: BoxFit.cover,
                              height: Get.height * 0.2,
                            ),
                            // CachedNetworkImage(
                            //   imageUrl: 'https://dummyimage.com/70x70/000/fff',
                            //   width: Get.width,
                            //   height: Get.height * 0.3,
                            //   fit: BoxFit.cover,
                            //   placeholderFadeInDuration: Duration(milliseconds: 500),
                            //   placeholder: (context, url) => Shimmer.fromColors(
                            //     baseColor: Colors.grey[300]!,
                            //     highlightColor: Colors.grey[100]!,
                            //     child: Container(
                            //       color: Colors.white,
                            //       width: Get.width,
                            //       height: Get.height * 0.3,
                            //     ),
                            //   ),
                            //   errorWidget: (context, url, error) => Icon(Icons.error),
                            // ),
                            Positioned(
                              bottom: -26,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: AppNetworkImage(
                                    networkImage:
                                        controller.garage!.logo.toString(),
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                            )
                          ]),
                      Gap(35),
                      AppText(
                        title: controller.garage!.name.toString(),
                        size: 14,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(controller.garage!.rating.toString()),
                            itemCount: 5,
                            itemSize: 11,
                            unratedColor: AppColors.black.withOpacity(0.5),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Gap(5),
                          AppText(
                            title: controller.garage!.rating.toString(),
                            textAlign: TextAlign.center,
                            size: 10,
                          ),
                        ],
                      ),
                      Gap(10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65),
                        child: AppText(
                          title: controller.garage!.description.toString(),
                          size: 12,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                      Gap(20),
                      if (controller.garage!.garageTime!.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/sun.svg'),
                            Gap(5),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Opened from '.tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: controller
                                        .garage!.garageTime![0].openTime
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                  TextSpan(
                                    text: ' to '.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller
                                        .garage!.garageTime![0].closeTime
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      // if (controller.garage!.opened == false)
                      //   AppText(
                      //     title: 'Garage is currently off'.tr,
                      //   ),
                      if (controller.garage!.garageTime!.isNotEmpty) Gap(5),
                      if (controller.garage!.garageTime!.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/moon.svg'),
                            Gap(5),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Opened from '.tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: controller
                                        .garage!.garageTime![1].openTime
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                  TextSpan(
                                    text: ' to '.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller
                                        .garage!.garageTime![1].openTime
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipPath(
                                    clipper: RightCircularClipper(),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(
                                            GarageReviewBottomSheetView(),
                                            isScrollControlled: true);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.lightPink,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20))),
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/star.svg',
                                                height: 16,
                                                width: 16),
                                            Gap(5),
                                            AppText(
                                                title: 'View reviews'.tr,
                                                color: AppColors.primarybg,
                                                size: 11,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.25,
                                  )
                                ],
                              ),
                              Positioned(
                                right: 0,
                                height: Get.height * 0.05,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => ChatScreenView(
                                        id: controller.garage!.id.toString(),
                                        name: controller.garage!.name.toString(),
                                        profilePic: '',
                                        screen: 'chat'));
                                  },
                                  child: Container(
                                    height: Get.height * 0.045,
                                    padding: EdgeInsets.symmetric(horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightPink,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/chat.svg',
                                            height: 16,
                                            width: 16,
                                            color: AppColors.primary,
                                          ),
                                          AppText(
                                            title: 'Chat'.tr,
                                            size: 11,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primarybg,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(30),
                      if (controller.productId != '' ||
                          controller.productextraId != '')
                        AppText(
                          title: 'Selected Product'.tr,
                          size: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                        ),
                      if (controller.productId != '' ||
                          controller.productextraId != '')
                        Gap(10),
                      if (controller.productId != '' ||
                          controller.productextraId != '')
                        InkWell(
                          onTap: () {
                            UiUtilites.confirmAlertDialog(
                              context: context,
                              onCancelTap: () {
                                Get.back();
                              },
                              onConfirmTap: () async {
                                controller.addToCart();
                              },
                              title:
                                  'Are you Sure that you want\n to Add this product to cart ?'
                                      .tr,
                              cancelText: 'No'.tr,
                              confirmText: 'Yes'.tr,
                            );
                          
                          },
                          child: GarageProductCard(),
                        ),
                      Gap(20),
                      Divider(
                        thickness: 10,
                        color: AppColors.grey.shade100,
                      ),
                      Gap(20),
                      AppText(
                        title: 'Our Services'.tr,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(25),

                      GridView.builder(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 1.0,
                          mainAxisExtent: Get.height * 0.17,
                        ),
                        itemCount: controller.categories!.length,
                        itemBuilder: (context, index) {
                          final item = controller.categories![index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.servicedetail, parameters: {
                                'garageid': controller.garage!.id.toString(),
                                'serviceId':
                                    controller.categories![index].id.toString()
                              });
                            },
                            child: ServicesIcons(
                              imageUrl: item.image.toString(),
                              text: 
                              box.read('locale') == 'ar'
                                  ? item.ar_name.toString()
                                  :
                              item.name.toString(),
                            ),
                          );
                        },
                      ),
                      Gap(30),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       AppText(
                      //         title: 'Car wash',
                      //         size: 14,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //       Container(
                      //         decoration: BoxDecoration(
                      //             color: AppColors.lightPink,
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               horizontal: 10, vertical: 5),
                      //           child: Row(
                      //             children: [
                      //               AppText(
                      //                 title: 'View less',
                      //                 size: 10,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: AppColors.primary,
                      //               ),
                      //               Gap(3),
                      //               Icon(
                      //                 Icons.keyboard_arrow_up,
                      //                 color: AppColors.primary,
                      //                 size: 16,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // Gap(30),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: List.generate(
                      //       4,
                      //       (index) {
                      //         return Center(
                      //           child: Padding(
                      //             padding: index == 0
                      //                 ? EdgeInsets.only(left: 20)
                      //                 : EdgeInsets.only(left: 8),
                      //             child: ServiceCard(
                      //               // image: 'https://dummyimage.com/70x70/000/fff',

                      //               image: 'assets/images/street_garage.png',

                      //               title: 'Hand\nwashing car',
                      //               onTap: () {
                      //                 Get.toNamed(AppRoutes.bookservice);
                      //               },
                      //               price: '30.50 AED',
                      //               time: '12 :61',
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // Gap(20),
                    ],
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
