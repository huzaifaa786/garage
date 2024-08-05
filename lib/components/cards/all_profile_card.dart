// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class AllProfileCard extends StatelessWidget {
  const AllProfileCard({
    super.key,
    required this.text,
    required this.image,
    required this.ontap,
    required this.text2,
    required this.height,
    required this.width,
  });
  final String text;
  final String image;
  final String text2;
  final height;
  final width;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(40),
          //Image.asset('assets/images/location.png'),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.lightprimary,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: SvgPicture.asset(
                    image,
                    color: AppColors.primarybg,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Gap(10),
                AppText(
                  title: text,
                  size: 12,
                  fontWeight: FontWeight.w500,
                  overFlow: TextOverflow.ellipsis,
                ),
                Gap(5),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.29),
                  child: AppText(
                    title: text2,
                    size: 10,
                    fontWeight: FontWeight.w400,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg',
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
