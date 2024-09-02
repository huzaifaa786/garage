// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  final String price;
  final time;

  ServiceCard({
    required this.image,
    required this.title,
    required this.onTap,
    required this.price,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.32,
      // height: Get.height * 0.3 / 1.3,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      assetPath: 'assets/images/washing.png',
                      width: double.infinity,
                      height: 80,
                    )),
              ),
              Positioned(
                top: 8,
                left: 8,
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
                        assetPath: 'assets/images/street_garage.png',
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 8.0,
              bottom: 6.0,
            ),
            child: SizedBox(
              // width: Get.width * 0.18,
              child: AppText(
                title: title,
                fontWeight: FontWeight.w600,
                size: 10.0,
                maxLines: 2,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Row(
          //     children: [
          //       SvgPicture.asset(
          //         "assets/icons/clock.svg",
          //         width: 9,
          //         height: 9,
          //       ),
          //       Gap(3),
          // AppText(
          //   title: time,
          //   color: AppColors.primary,
          //   size: 8,
          //   fontWeight: FontWeight.w400,
          // ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 25,
                      child: AppText(
                        title: price,
                        color: Color.fromARGB(255, 0, 91, 165),
                        fontWeight: FontWeight.w600,
                        size: 10.0,
                        maxLines: 1,
                        overFlow: TextOverflow.visible,
                      ),
                    ),
                    AppText(
                      title: 'AED',
                      color: Color.fromARGB(255, 0, 91, 165),
                      fontWeight: FontWeight.w600,
                      size: 10.0,
                    ),
                  ],
                ),
                IconButton(
                  icon: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/icons/cart_icon.svg',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  onPressed: onTap,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
