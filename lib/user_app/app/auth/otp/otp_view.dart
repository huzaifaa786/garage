// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/auth/otp/otp_controller.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/components/buttons/main_button.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  box.read('locale') != 'ar'
                      ? 'assets/icons/backarrow.svg'
                      : 'assets/icons/backarrow_right.svg',
                  color: AppColors.black,
                  height: 30,
                ),
                Gap(5),
                Text('Back'.tr),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(65),
                    AppText(
                      title: 'Verify your phone'.tr,
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      title: 'number'.tr,
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    Gap(20),
                    AppText(
                      title: 'We have sent you an OTP code to your'.tr,
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                    AppText(
                      title: 'number, please enter it to continue'.tr,
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black.withOpacity(0.4),
                    ),
                    Gap(43),

                    // OtpTextField(
                    //   borderRadius: BorderRadius.circular(6.0),
                    //   numberOfFields: 6,
                    //   fieldHeight: 51,
                    //   fieldWidth: 42,
                    //   keyboardType: TextInputType.number,
                    //   focusedBorderColor: AppColors.primary,
                    //   fillColor: AppColors.lightgrey,
                    //   showFieldAsBox: true,
                    //   borderWidth: 1.0,
                    //   textStyle: TextStyle(
                    //       color: AppColors.black,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.w600),
                    //   onCodeChanged: (String code) {
                    //     controller.otpCode = code;
                    //   },
                    //   onSubmit: (String verificationCode) {
                    //     controller.otpCode = verificationCode;
                    //     controller.verifyOtpCode();
                    //   },
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: PinCodeTextField(
                        appContext: context,
                        // pastedTextStyle: TextStyle(
                        //   color: Colors.green.shade600,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 40,
                            fieldWidth: 35,
                            activeFillColor: AppColors.lightgrey,
                            activeColor: AppColors.primary,
                            inactiveFillColor: AppColors.white,
                            selectedColor: AppColors.primary,
                            selectedFillColor: AppColors.white,
                            inactiveColor: AppColors.primary,
                            activeBorderWidth: 1.0,
                            inactiveBorderWidth: 1.0),
                        cursorColor: const Color.fromARGB(255, 222, 40, 43),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          // debugPrint("Completed");
                          controller.otpCode = v;
                          // controller.verifyOtpCode();
                          // controller.veryifyTestCode();
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          print('ddd');
                        },

                        // beforeTextPaste: (text) {
                        //   debugPrint("Allowing to paste $text");
                        //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        //   return true;
                        // },
                      ),
                    ),
                    // ),
                    // ),
                    Gap(80),
                    MainButton(
                      buttonWidth: 300.0,
                      title: 'Continue'.tr,
                      onTap: () {
                        controller.authmethod == 'changeNumber'
                            ? controller.verifyOtpCode()
                            : controller.veryifyTestCode();
                      },
                    ),
                    Gap(33),
                    // GestureDetector(
                    //   onTap: () {
                    //     // controller.verifyPhone();
                    //     print('object');
                    //   },
                    //   child: AppText(
                    //     title: 'Resend'.tr,
                    //     color: AppColors.darkprimary,
                    //     size: 16,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
