// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class DateLocationCard extends StatelessWidget {
  DateLocationCard({super.key, this.txt});
  String? txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightprimary,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Get.width * 0.685,
              ),
              child: AppText(
                title: txt!,
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.primarybg,
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}
