// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/auth/signup/signup_controller.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input.dart';
import 'package:mobilegarage/user_app/components/textfields/main_input_dropdown.dart';
import 'package:mobilegarage/user_app/components/textfields/phone_inputfield.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_constants/text_strings.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primarybg,
          toolbarHeight: 20,
          automaticallyImplyLeading: false,
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
                        child: Column(
                          children: [
                            Gap(30),
                               AppText(
                                    title: ConstantStrings.sign_up,
                                    size: 28,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.heading_text_color,
                                    fontFamily: 'Ibarra Real Nova',
                                  ),
                            // AppText(
                            //   title: 'Sign Up',
                            //   size: 32,
                            //   fontWeight: FontWeight.w400,
                            //   color: AppColors.primarybg,
                            //   fontFamily: 'Ibarra Real Nova',
                            // ),
                            Gap(30),
                            MainInput(
                              hint: 'Name'.tr,
                              controller: controller.nameController,
                              errorText: '',
                            ),
                            Gap(20),
                            PhoneInputField(
                              controller: controller.phoneController,
                              onChanged: controller.onChanged,
                            ),
                            Gap(20),
                            MainInputDropdown(
                              hint: 'Emirate'.tr,
                              controller: controller.emirateController,
                              errorText: '',
                              onchange: (value) {
                                controller.emirateController.text = value;
                                // controller.emirateValidation(value);
                              },
                              items: controller.city,
                            ),
                            Gap(20),
                            MainInput(
                              hint: 'Address details'.tr,
                              controller: controller.adreesdetailController,
                              errorText: '',
                            ),
                            Gap(40),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'By continuing you agree to the',
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '\n\tterms',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: '\tand',
                                    ),
                                    TextSpan(
                                        text: '\tconditions',
                                        style: TextStyle(
                                            wordSpacing: 1,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            Gap(49),
                            MainButton(
                              title: 'Sign Up',
                              txtweight: FontWeight.w600,
                              onTap: () {
                                Get.toNamed(AppRoutes.cardetails);
                              },
                            ),
                            Gap(40),
                            AuthRichText(
                              title: 'Already have an account?',
                              description: 'Sign In',
                              titlesize: 14,
                              descriptiosize: 14,
                              titlefontweight: FontWeight.w500,
                              descriptionfontweight: FontWeight.w600,
                              descriptionColor: AppColors.primary,
                              titleColor: Colors.black.withOpacity(0.6),
                              onTap: () {
                                Get.offAllNamed(AppRoutes.signin);
                              },
                            ),
                            Gap(60),
                          ],
                        ),
                      ),
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
