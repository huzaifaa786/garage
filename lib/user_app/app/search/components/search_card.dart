// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SearchCard extends StatelessWidget {
  final String? image;
  final String? logoimage;

  final String? title;
  final String? services;

  final VoidCallback? onTap;
  final String? price;

  const SearchCard({
    this.image,
    this.services,
    this.title,
    this.onTap,
    this.price,
    this.logoimage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    child: AppNetworkImage(
                      assetPath: 'assets/images/car_fueling.png',
                      height: Get.height * 0.15,
                      width: Get.width,
                      // fit: BoxFit.cover,
                    ),
                    // child: CachedNetworkImage(
                    //   imageUrl: image!,
                    //   height: Get.height * 0.15,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    //   placeholder: (context, url) => CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        width: 2,
                        color: AppColors.lightprimary,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: AppNetworkImage(
                        assetPath: 'assets/images/car_fueling.png',
                        // fit: BoxFit.cover,
                      ),
                      // child: CachedNetworkImage(
                      //   imageUrl: logoimage!,
                      //   fit: BoxFit.cover,
                      //   height: 26,
                      //   width: 26,
                      //   placeholder: (context, url) =>
                      //       CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: title!,
                        fontWeight: FontWeight.w600,
                        size: 12,
                      ),
                      AppText(
                        title: services!,
                        fontWeight: FontWeight.w500,
                        size: 10.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Gap(7),
                  Row(
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
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  Gap(7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/icons/map_pin.svg'),
                      Gap(5),
                      SizedBox(
                        width: Get.width * 0.70,
                        child: AppText(
                          title: 'Dubai Zayed street , road 3452 ',
                          size: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 5),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipPath(
                              clipper: RightCircularClipper(),
                              child: GestureDetector(
                                onTap: () {
                                  print('object');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.lightprimary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.67,
                                  child: Center(
                                    child: Text(
                                      'View garage',
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(13)
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
                                width: Get.width * 0.085,
                                decoration: BoxDecoration(
                                  color: AppColors.lightprimary,
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  color: AppColors.primary,
                                )
                                // child: Image.asset(
                                //   'assets/images/chat.png',
                                //   color: AppColors.primary,
                                // ),
                                ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
