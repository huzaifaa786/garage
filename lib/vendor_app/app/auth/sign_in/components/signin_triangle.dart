import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/painters/triangle_painter.dart';

class SignInTriangle extends StatelessWidget {
  const SignInTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(Get.width, Get.width * 0.3),
          painter: TriAnglePainter(),
        ),
        Positioned(
          top: 12,
          left: 70,
          child: Column(
            children: [
              Image.asset(
                ImageConst.home_ic,
                height: 55,
                width: 80,
                color: AppColors.primary_color,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
