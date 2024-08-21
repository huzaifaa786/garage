// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class ServicesTypesCard extends StatelessWidget {
  final String serviceName;
  final String price;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const ServicesTypesCard({
    super.key,
    required this.serviceName,
    required this.price,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.05,
      width: Get.width * 0.38,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio<bool>(
                value: true,
                groupValue: isSelected ? true : null,
                onChanged: onChanged,
                fillColor: MaterialStateProperty.all(AppColors.primarybg),
                activeColor: AppColors.primarybg,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.26,
                  maxHeight: Get.height * 0.09,
                ),
                child: AppText(
                  title: serviceName,
                  color: AppColors.black,
                  maxLines: 3,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(10),
              AppText(
                title: price,
                color: AppColors.darkblue,
                size: 12,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
