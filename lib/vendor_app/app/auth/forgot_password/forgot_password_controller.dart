import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/auth/forgot_password_apis/forgot_password_api.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VForgotPasswordController extends GetxController {
  static VForgotPasswordController instance = Get.find();
  GetStorage box = GetStorage();
  TextEditingController emailController = TextEditingController();
  String emailError = '';

  //TODO: OTP VERIFY VARIABLE'S
  TextEditingController otpController = TextEditingController();
  String? otpCode;
  bool isOtpValid = false;

  //TODO: ON OTP COMPLETE
  onComplete(String verificationCode) {
    isOtpValid = true;
    otpCode = verificationCode;
    update();
  }

  //TODO: ON OTP CHANGE
  onChange(value) {
    if (value.length < 6) {
      isOtpValid = false;
    }
    update();
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Email':
        emailError = Validators.emailValidator(value) ?? '';
        update();
        return emailError;
      default:
        return '';
    }
  }

  //TODO: FORGOT VALIDATION
  Future<bool> validateForm() async {
    final emailErrorString = validateFields('Email', emailController.text);
    return emailErrorString.isEmpty;
  }

  //TODO: Forgot Function
  forgot() async {
    if (await validateForm()) {
      var response =
          await VForgotPasswordApi.forgotpassword(email: emailController.text);
      if (response.isNotEmpty) {
        Get.toNamed(AppRoutes.vforgot_otp_verify);
      }
    }
  }

  //TODO: VERIFY OTP
  verifyOtp() async {
    if (otpController.text.length < 6) {
      UiUtilites.errorSnackbar('Error'.tr, 'Fill out complete otp.'.tr);
      return;
    }
    var response = await VForgotPasswordApi.verifyotp(
        otp: otpCode, email: emailController.text);
    if (response.isNotEmpty) {
      Get.toNamed(AppRoutes.vchange_forgot_password,
          parameters: {'email': emailController.text});

    }
  }
}
