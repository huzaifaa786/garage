// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class ContainerSelect extends StatelessWidget {
  const ContainerSelect({
    super.key,
    this.text,
    this.ontap,
  });
  final text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary_color,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
