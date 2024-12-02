import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/components/back_button.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/components/otp_pin_field.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_password_controller.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/components/signin_triangle.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VForgotOtpVerifyView extends StatelessWidget {
  const VForgotOtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VForgotPasswordController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.primary_color,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height * 0.88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      ImageConst.appLogo,
                      width: 172,
                      height: 108,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: Get.width,
                            height: Get.height,
                            color: AppColors.white_color,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: Column(
                                children: [
                                  const Gap(40),
                                  AppText(
                                    title: 'Verify Otp'.tr,
                                    size: 28,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.heading_text_color,
                                    fontFamily: 'Ibarra Real Nova',
                                  ),
                                  const Gap(6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: AppText(
                                      title:
                                          'Please enter the OTP sent to your email address to reset your password.'
                                              .tr,
                                      size: 12,
                                      color: AppColors.hint_text_color,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Gap(50),
                                  AppOtpPinField(
                                    controller: controller.otpController,
                                    onChange: controller.onChange,
                                    onComplete: controller.onComplete,
                                  ),
                                  const Gap(50),
                                  AppButton(
                                    title: 'Confirm'.tr,
                                    buttonColor: AppColors.primary_color,
                                    ontap: () {
                                      controller.verifyOtp();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //* Triangle
                        Positioned(
                          left: Get.width * 0.2,
                          child: const SignInTriangle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BackIConButton(),
      ),
    );
  }
}
