import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobilegarage/app/splash/splash_controller.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.primarybg,
        body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Center(
              child: Image.asset(
                'assets/images/splash_logo.png',
                height: 150,
              ),
            )),
      ),
    );
  }
}
