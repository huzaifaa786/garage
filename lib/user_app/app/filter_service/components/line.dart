// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      width: 2,
      decoration: BoxDecoration(
        color: AppColors.primarybg,
        // borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
