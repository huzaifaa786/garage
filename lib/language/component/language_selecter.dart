// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class LanguageSelecter extends StatelessWidget {
  const LanguageSelecter(
      {super.key, this.text, this.ontap, this.isSelected = false});
  final text;
  final ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 70,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.light_red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: text,
                  size: 27,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary_color,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
