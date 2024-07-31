// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/app/auth/signup/signup_controller.dart';
import 'package:mobilegarage/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
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
              Image.asset('assets/images/splash_logo.png'),
              Container(
                height: Get.height * 0.741,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      children: [
                        Gap(30),
                        AppText(
                          title: 'Sign Up',
                          size: 32,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primarybg,
                        ),
                        Gap(30),
                        PhoneInputField(
                          controller: controller.phoneController,
                          onChanged: controller.onChanged,
                        ),
                      ],
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
