// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ServicesIcons extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String subText;
  final ontap;
  const ServicesIcons(
      {Key? key,
      required this.imageUrl,
      required this.text,
      this.ontap,
      required this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.12,
            width: Get.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.shadowblack,
              //     blurRadius: 4.0,
              //     offset: Offset(0, 4),
              //   ),
              // ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AppNetworkImage(
                  assetPath: 'assets/images/car_washes.png',
                )
                ),
          ),
          Gap(5),
          Flexible(
            flex: 1,
            child: SizedBox(
              height: Get.height * 0.2,
              child: AppText(
                title: text,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                size: 12.0,
                textAlign: TextAlign.center,
                overFlow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          Gap(3),
          Flexible(
            flex: 1,
            child: SizedBox(
              // height: Get.height*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: subText,
                    // 'View more'
                    size: 8,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primarybg,
                    overFlow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Gap(2),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                    color: AppColors.primarybg,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
