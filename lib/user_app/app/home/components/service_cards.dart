// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String? logo;
  final String title;
  final VoidCallback onTap;
  final VoidCallback oncardTap;

  final String price;
  final time;

  ServiceCard({
    required this.image,
    required this.title,
    required this.onTap,
    required this.oncardTap,
    required this.price,
    this.time,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: oncardTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(0, 3),
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
                        networkImage: image,
                        assetPath: 'assets/images/washing.png',
                        width: double.infinity,
                        height: Get.height * 0.12,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        width: 2,
                        color: AppColors.lightPink,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: AppNetworkImage(
                          networkImage: logo,
                          height: 40.0,
                          width: 40.0,
                          assetPath: 'assets/images/street_garage.png',
                          fit: BoxFit.cover,
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
              child: AppText(
                title: title,
                fontWeight: FontWeight.w600,
                size: 10.0,
                maxLines: 2,
                overFlow: TextOverflow.ellipsis,
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                    width: 9,
                    height: 9,
                  ),
                  Gap(5),
                  AppText(
                    title: time + ' min',
                    color: AppColors.primary,
                    size: 9,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title: price + ' ' + 'AED',
                    color: Color.fromARGB(255, 0, 91, 165),
                    fontWeight: FontWeight.w600,
                    size: 11.0,
                    maxLines: 1,
                    overFlow: TextOverflow.visible,
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: Container(
                      height: 24,
                      width: 24,
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
