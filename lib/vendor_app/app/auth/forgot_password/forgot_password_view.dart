import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/components/back_button.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_password_controller.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/components/signin_triangle.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';

class VForgotPasswordView extends StatelessWidget {
  const VForgotPasswordView({super.key});

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
                                    title: ConstantStrings.forgot_password,
                                    size: 28,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.heading_text_color,
                                    fontFamily: 'Ibarra Real Nova',
                                  ),
                                  Gap(6),
                                  AppText(
                                    title: 'Enter your registered Email',
                                    size: 12,
                                    color: AppColors.hint_text_color,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  Gap(50),
                                  AppInputField(
                                    errorText: controller.emailError,
                                    hint: 'Email',
                                    controller: controller.emailController,
                                    onchange: (val) {
                                      controller.validateFields("Email", val);
                                    },
                                  ),
                                  const Gap(50),
                                  AppButton(
                                    title: 'Confirm',
                                    buttonColor: AppColors.primary_color,
                                    ontap: () {
                                       controller.forgot();
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
        bottomNavigationBar: BackIConButton(),
      ),
    );
  }
}
