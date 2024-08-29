import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/components/signin_triangle.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/signin_controller.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/const_images.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';
import 'package:mobilegarage/vendor_app/utils/app_inputfields/app_inputfield.dart';
import 'package:mobilegarage/vendor_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/vendor_app/utils/rich_text/rich_text.dart';

class VSignInView extends StatelessWidget {
  const VSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VSignInController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.primary_color,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height * 0.96,
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
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Column(
                                children: [
                                  const Gap(40),
                                  AppText(
                                    title: ConstantStrings.sign_in,
                                    size: 28,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.heading_text_color,
                                    fontFamily: 'Ibarra Real Nova',
                                  ),
                                  const Gap(25),
                                  AppInputField(
                                    errorText: controller.emailError,
                                    hint: 'Email',
                                    controller: controller.emailController,
                                    onchange: (val) {
                                      controller.validateFields("Email", val);
                                    },
                                  ),
                                  const Gap(12),
                                  AppInputField(
                                    errorText: controller.passwordError,
                                    hint: 'Password',
                                    obscure: controller.obscurePassword,
                                    controller: controller.passwordController,
                                    onchange: (val) {
                                      controller.validateFields("password", val);
                                    },
                                    hasSuffix: true,
                                    suffixWidget: InkWell(
                                      onTap: controller.passwordToggle,
                                      child: controller.obscurePassword
                                          ? SvgPicture.asset(
                                              ImageConst.eye_off_ic,
                                              fit: BoxFit.scaleDown,
                                            )
                                          : SvgPicture.asset(
                                              ImageConst.eye_ic,
                                              fit: BoxFit.scaleDown,
                                            ),
                                    ),
                                  ),
                                  const Gap(20),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.forgot_password);
                                    },
                                    child: AppText(
                                      title: 'Forgot password?',
                                      color: AppColors.primary_color,
                                      fontWeight: FontWeight.w600,
                                      size: 12,
                                    ),
                                  ),
                                  const Gap(20),
                                  AppButton(
                                    title: 'Sign In',
                                    buttonColor: AppColors.primary_color,
                                    ontap: () {
                                      //  controller.login();

                                    },
                                  ),
                                  const Gap(30),
                                  AppRichText(
                                    title: "Don’t have an account?",
                                    buttonText: 'Sign Up',
                                    onTap: () {
                                      Get.toNamed(AppRoutes.vsignup);
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
      ),
    );
  }
}
