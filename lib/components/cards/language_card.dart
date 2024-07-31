// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    super.key,
    this.ontap,
    this.title,
    this.isSelected = false,
  });
  final ontap;
  final title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.1,
        decoration: BoxDecoration(
            color: AppColors.primaryborder,
            border: Border.all(
                color:
                    isSelected ? AppColors.primary : AppColors.primaryborder),
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
