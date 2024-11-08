// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ImageSelectionTile extends StatelessWidget {
  const ImageSelectionTile({
    super.key,
    this.isSelected = false,
    this.title,
    this.onTap,
  });
  final bool isSelected;
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(45),
          child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 1.0,
              color:
                  isSelected ? AppColors.green_color : AppColors.primary_color,
              dashPattern: const <double>[4, 2],
              padding: const EdgeInsets.all(0),
              radius: const Radius.circular(45),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: isSelected
                        ? AppColors.green_color.withOpacity(0.07)
                        : AppColors.primary_color.withOpacity(0.07)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConst.image_ic,
                      color: isSelected
                          ? AppColors.green_color
                          : AppColors.primary_color,
                    ),
                    const Gap(4),
                    AppText(
                      title: isSelected ? 'Uploaded'.tr : '$title',
                      size: 12,
                      color: isSelected
                          ? AppColors.green_color
                          : AppColors.primary_color,
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
