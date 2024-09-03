// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/selectside/component/container.dart';
import 'package:mobilegarage/selectside/selectside_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SelectsideView extends StatefulWidget {
  const SelectsideView({super.key});

  @override
  State<SelectsideView> createState() => _SelectsideViewState();
}

class _SelectsideViewState extends State<SelectsideView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectSideController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarybg,
          toolbarHeight: 20,
        ),
        body: SafeArea(
            child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(color: AppColors.primarybg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image.asset('assets/images/splash_logo.png'),
              SvgPicture.asset(
                'assets/icons/mobile_garagelogo.svg',
                color: AppColors.white,
                height: 162,
                width: 293,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                  child: Container(
                    height: Get.height * 0.741,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                          ),
                          child: Column(children: [
                            Gap(30),
                            AppText(
                              title: 'Selct side..',
                              size: 28,
                              fontWeight: FontWeight.w600,
                              // color: AppColors.primarybg,
                              color: AppColors.darkprimary,
                            ),
                            Gap(120),
                            ContainerSelect(
                              ontap: () {
                                Get.toNamed(AppRoutes.signup);
                              },
                              text: 'User',
                            ),
                            Gap(60),
                            ContainerSelect(
                              text: 'Garage Owner',
                              ontap: () {
                                Get.toNamed(AppRoutes.vsignup);
                              },
                            ),
                          ])),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
