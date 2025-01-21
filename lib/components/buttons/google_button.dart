// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    this.isSelected = false,
    this.address,
    this.onTap,
  });
  final bool isSelected;
  final String? address;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(45),
      child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1.0,
          color: isSelected ? AppColors.green_color : AppColors.primary_color,
          dashPattern: const <double>[4, 2],
          // padding: const EdgeInsets.all(0),
          radius: const Radius.circular(45),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: isSelected
                    ? AppColors.green_color.withOpacity(0.07)
                    : AppColors.primary_color.withOpacity(0.07),
                image: DecorationImage(
                    image: AssetImage('assets/images/map_image.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/map_pin.svg',
                    color: isSelected
                        ? AppColors.green_color
                        : AppColors.primary_color,
                  ),
                  const Gap(6),
                  Flexible(
                    child: AppText(
                      title:
                          address != '' ? '$address' : 'Pin location in map'.tr,
                      size: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? AppColors.black_color
                          : AppColors.primary_color,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
