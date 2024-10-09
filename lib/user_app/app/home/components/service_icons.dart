// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/App_image_network/app_image_network.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ServicesIcons extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String? subText;
  final bool showSubtext;
  final ontap;
  const ServicesIcons(
      {Key? key,
       this.showSubtext = false,
      required this.imageUrl,
      required this.text,
      this.ontap,
       this.subText})
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
            child: AppNetworkImage(
              networkImage: imageUrl,
            ),
          ),
          Gap(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: AppText(
              title: text,
              fontWeight: FontWeight.w500,
              color: AppColors.primarybg,
              size: 10.0,
              textAlign: TextAlign.center,
              overFlow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Gap(1),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(showSubtext)
                AppText(
                  
                  title: subText!,
                  
                  size: 8,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primarybg,
                  overFlow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Gap(2),
                // SvgPicture.asset(
                //   'assets/icons/arrow_right.svg',
                //   color: AppColors.primarybg,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
