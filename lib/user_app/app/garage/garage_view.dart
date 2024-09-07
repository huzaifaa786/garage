// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/garage/garage_controller.dart';
import 'package:mobilegarage/user_app/app/garage_review/garage_review_view.dart';
import 'package:mobilegarage/user_app/app/home/components/service_cards.dart';
import 'package:mobilegarage/user_app/app/home/components/service_icons.dart';
import 'package:mobilegarage/user_app/components/app_bar/top_bar.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:shimmer/shimmer.dart';

class GarageView extends StatelessWidget {
  const GarageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0.0,
            toolbarHeight: 80,
            title: TopBar(
              title: 'Street Garage',
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
                        assetPath: 'assets/images/garage.png',
                        width: Get.width,
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
                          child: ClipOval(
                              child: AppNetworkImage(
                            assetPath: 'assets/images/street_garage.png',
                            height: Get.height * 0.08,
                            width: Get.width * 0.16,
                          )),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                AppText(
                  title: 'Street Garage',
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
                Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 4.0,
                      itemCount: 5,
                      itemSize: 11,
                      unratedColor: AppColors.black.withOpacity(0.5),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Gap(3),
                    AppText(
                      title: '4.0',
                      size: 10,
                    ),
                  ],
                ),
                Gap(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  child: AppText(
                    title:
                        'in street garage we can solve all your car problems with the best price!',
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greybg,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipPath(
                            clipper: RightCircularClipper(),
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(GarageReviewBottomSheetView(),
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
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/star.svg'),
                                      Gap(5),
                                      Text(
                                        'View reviews',
                                        style: TextStyle(
                                            color: AppColors.primarybg,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(
                            8,
                          ),
                          SizedBox(
                            width: Get.width * 0.13,
                          )
                        ],
                      ),
                      Positioned(
                        right: 0,
                        top: Get.height * 0.003,
                        child: GestureDetector(
                          onTap: () {
                            print('object23');
                          },
                          child: Container(
                            height: Get.height * 0.045,
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
                                    width: Get.width * 0.07,
                                    color: AppColors.primary,
                                  ),

                                  // Image.asset(
                                  //   'assets/images/chat.png',
                                  //   color: AppColors.primarybg,
                                  // ),
                                  // Gap(2),
                                  AppText(
                                    title: 'Chat',
                                    size: 11,
                                    fontWeight: FontWeight.w500,
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
                Gap(25),
                AppText(
                  title: 'Our Services',
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
                Gap(25),
                GridView.builder(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 130,
                  ),
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    final item = controller.services[index];
                    bool iselected = controller.selectedindex == index;
                    return GestureDetector(
                      onTap: () {
                        controller.selectindex(index);
                      },
                      child: ServicesIcons(
                        imageUrl: item.imageUrl,
                        text: item.text,
                        subText: item.subText,
                      ),
                    );
                  },
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: 'Car wash',
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightPink,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              AppText(
                                title: 'View less',
                                size: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                              Gap(3),
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: AppColors.primary,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Gap(30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) {
                        return Center(
                          child: Padding(
                            padding: index == 0
                                ? EdgeInsets.only(left: 20)
                                : EdgeInsets.only(left: 8),
                            child: ServiceCard(
                              // image: 'https://dummyimage.com/70x70/000/fff',

                              image: 'assets/images/street_garage.png',

                              title: 'Hand\nwashing car',
                              onTap: () {
                                Get.toNamed(AppRoutes.bookservice);
                              },
                              price: '30.50 AED',
                              time: '12 :61',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
