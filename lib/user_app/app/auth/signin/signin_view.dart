// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/auth/signin/signin_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
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
                                          title: 'Sign In',
                                          size: 32,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primarybg,
                                        ),
                                        Gap(30),
                                        PhoneInputField(
                                          controller:
                                              controller.phoneController,
                                          onChanged: controller.onChanged,
                                        ),
                                        Gap(40),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Checkbox(
                                              value: controller.isChecked,
                                              onChanged: (bool? value) {
                                                controller.toggleCheckbox();
                                              },
                                              activeColor: AppColors.primary,
                                            ),
                                            AppText(
                                              title: 'Remember me',
                                              size: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                            )
                                          ],
                                        ),
                                        Gap(70),
                                        MainButton(
                                          title: 'Sign In',
                                          txtweight: FontWeight.w600,
                                          onTap: () {
                                            Get.toNamed(AppRoutes.otp);
                                          },
                                        ),
                                        Gap(40),
                                        AuthRichText(
                                          title: 'Dont have an account?',
                                          description: 'Sign up',
                                          titlesize: 14,
                                          descriptiosize: 14,
                                          titlefontweight: FontWeight.w500,
                                          descriptionfontweight:
                                              FontWeight.w600,
                                          descriptionColor: AppColors.primary,
                                          titleColor:
                                              Colors.black.withOpacity(0.6),
                                          onTap: () {
                                            Get.offAllNamed(AppRoutes.signup);
                                          },
                                        ),
                                      ]),
                                    )))))
                      ])))),
    );
  }
}