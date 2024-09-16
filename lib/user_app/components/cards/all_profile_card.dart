import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class AllProfileCard extends StatelessWidget {
  const AllProfileCard({
    super.key,
    this.text,
    required this.image,
    required this.ontap,
    this.text2,
    required this.height,
    required this.width,
    required this.color,
    required this.textColor,
  });

  final text;
  final String image;
  final text2;
  final height;
  final width;
  final VoidCallback ontap;
  final color;
  final textColor;

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.white),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: color,
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
                    color: textColor,
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
              box.read('locale') != 'ar'?
              SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                height: 20,
                width: 20,
              )
             : SvgPicture.asset(
                'assets/icons/arrow_leftside.svg',
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
