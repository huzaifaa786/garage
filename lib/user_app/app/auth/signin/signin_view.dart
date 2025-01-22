// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/auth/signin/signin_controller.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_rich_text.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/utils/app_phone_input/app_phone_input.dart';
// import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
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
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: SvgPicture.asset(
                            'assets/icons/mobile_garagelogo.svg',
                            color: AppColors.white,
                            height: 100,
                            width: 207,
                          ),
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
                                          title: 'Sign In'.tr,
                                          size: 28,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.heading_text_color,
                                          fontFamily: 'Ibarra Real Nova',
                                        ),
                                        Gap(30),
                                        // Directionality(
                                        //   textDirection:
                                        //       box.read('locale') != 'ar'
                                        //           ? TextDirection.ltr
                                        //           : TextDirection.ltr,
                                        //   child: PhoneInputField(
                                        //     controller:
                                        //         controller.phoneController,

                                        //     onChanged: controller.onChanged,
                                        //   ),
                                        // ),
                                        // Gap(20),
                                        Directionality(
                                          textDirection:
                                              box.read('locale') == 'ar'
                                                  ? TextDirection.ltr
                                                  : TextDirection.ltr,
                                          child: AppPhoneInput(
                                            initialCountryCode:
                                                controller.initialCode,
                                            // initialPhoneNumber: controller.phoneNumber,
                                            onCountryChanged:
                                                controller.onCountryChanged,
                                            errorText: controller.phoneError,
                                            onChanged:
                                                controller.phoneValidation,
                                            controller:
                                                controller.phoneController,
                                          ),
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
                                              side: BorderSide(
                                                  color: AppColors.primary),
                                            ),
                                            AppText(
                                              title: 'Remember me'.tr,
                                              size: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                            )
                                          ],
                                        ),
                                        Gap(30),
                                        Center(
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              text:
                                                  'By continuing you agree to the'
                                                      .tr,
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '\n\tterms'.tr,
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Get.toNamed(AppRoutes
                                                                .termscondition);
                                                          }),
                                                TextSpan(
                                                    text: '\tand'.tr,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Get.toNamed(AppRoutes
                                                                .termscondition);
                                                          }),
                                                TextSpan(
                                                    text: '\tconditions'.tr,
                                                    style: TextStyle(
                                                        wordSpacing: 1,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Get.toNamed(AppRoutes
                                                                .termscondition);
                                                          }),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Gap(49),
                                        MainButton(
                                          title: 'Sign In'.tr,
                                          txtweight: FontWeight.w600,
                                          onTap: () {
                                            // Get.toNamed(AppRoutes.otp);
                                            // controller.verifyNumber();
                                            controller.phoneController.text
                                                        .isEmpty &&
                                                    controller
                                                        .phoneError.isNotEmpty
                                                ? () {}
                                                : controller.login();
                                          },
                                        ),
                                        Gap(40),
                                        AuthRichText(
                                          title: 'don,t you have account?'.tr,
                                          description: 'Sign Up'.tr,
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
