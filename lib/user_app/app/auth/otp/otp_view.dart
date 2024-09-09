// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/app/auth/otp/otp_controller.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

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
                  'assets/icons/backarrow.svg',
                  color: AppColors.black,
                  height: 30,
                ),
                Gap(5),
                Text('Back'),
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
                    OtpTextField(
                      borderRadius: BorderRadius.circular(6.0),
                      numberOfFields: 6,
                      fieldHeight: 51,
                      fieldWidth: 42,
                      keyboardType: TextInputType.number,
                      focusedBorderColor: AppColors.primary,
                      fillColor: AppColors.lightgrey,
                      showFieldAsBox: true,
                      borderWidth: 1.0,
                      textStyle: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      onCodeChanged: (String code) {
                         controller.otpCode = code;
                      },
                      onSubmit: (String verificationCode) {
                         controller.otpCode = verificationCode;
                          controller.verifyOtpCode();
                      },
                    ),
                    Gap(33),
                    GestureDetector(
                      onTap: () {
                         controller.verifyPhone();
                        Get.offAllNamed(AppRoutes.main);
                      },
                      child: AppText(
                        title: 'Resend',
                        color: AppColors.darkprimary,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
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
