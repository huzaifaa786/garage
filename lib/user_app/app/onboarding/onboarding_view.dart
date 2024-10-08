// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/onboarding/fragments/fragment-1_view.dart';
import 'package:mobilegarage/user_app/app/onboarding/fragments/fragment-2_view.dart';
import 'package:mobilegarage/user_app/app/onboarding/fragments/fragment-3_view.dart';
import 'package:mobilegarage/user_app/app/onboarding/onboarding_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(50),
                      Image.asset('assets/images/auth_logo.png'),
                      SizedBox(
                          height: Get.height * 0.54,
                          child: PageView(
                            controller: controller.pgecontroller,
                            onPageChanged: (index) {
                              setState(() {
                                controller.updateSlideIndex(index);
                              });
                            },
                            children: [
                              FragmentOneView(),
                              FragmentTwoView(),
                              FragmentThreeView(),
                            ],
                          )),
                      MainButton(
                        title: controller.slideIndex == 0
                            ? 'Next'
                            : controller.slideIndex == 1
                                ? 'Next'
                                : 'Sign up',
                        height: 55.0,
                        buttonWidth: Get.width * 0.7,
                        onTap: controller.slideIndex == 0
                            ? () {
                                controller.nextPage();
                              }
                            : controller.slideIndex == 1
                                ? () {
                                    controller.nextPage();
                                  }
                                : () {
                                    Get.offAllNamed(AppRoutes.selectlang);
                                  },
                      ),
                      Gap(Get.height * 0.029),
                      MainButton(
                        title: controller.slideIndex != 2 ? 'Skip' : 'Sign in',
                        height: 55.0,
                        buttonWidth: Get.width * 0.7,
                        btncolor: AppColors.white,
                        textcolor: AppColors.primary,
                        onTap: () {
                          Get.offAllNamed(AppRoutes.selectlang);
                        },
                      ),
                      Gap(25),
                    ],
                  ),
                ),
              ),
            ));
  }
}
