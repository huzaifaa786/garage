// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

class DottedBorderButton extends StatelessWidget {
  const DottedBorderButton(
      {super.key,
      this.title,
      required this.imgselect,
      this.isImgSelected,
      this.selectedimgpath,
      this.imgRemove});
  final title;
  final VoidCallback imgselect;
  final isImgSelected;
  final selectedimgpath;
  final VoidCallback? imgRemove;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: imgselect,
      child: DottedBorder(
        color: isImgSelected == false ? AppColors.red : AppColors.lightgreen,
        strokeWidth: 1,
        dashPattern: [
          5,
          5,
        ],
        borderType: BorderType.RRect,
        radius: Radius.circular(34),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.lightPink,
          ),
          height: 47,
          child: Row(
            mainAxisAlignment: isImgSelected && selectedimgpath != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              if (isImgSelected && selectedimgpath != null)
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.file(
                      File(selectedimgpath!),
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                        onTap: imgRemove,
                        child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: AppColors.primary),
                            child: Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 10,
                            ))),
                  ),
                ]),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/image.svg',
                    color: isImgSelected == false
                        ? AppColors.red
                        : AppColors.lightgreen,
                  ),
                  Gap(4),
                  AppText(
                    title: isImgSelected == false ? title : 'Uploaded'.tr,
                    size: 12,
                    fontWeight: FontWeight.w500,
                    color: isImgSelected == false
                        ? AppColors.red
                        : AppColors.lightgreen,
                  ),
                ],
              ),
              Gap(14),
              if (isImgSelected == true)
                SvgPicture.asset('assets/icons/check-circle.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
