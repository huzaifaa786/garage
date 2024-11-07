import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signin_api/sign_in_api.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VSignInController extends GetxController {
  static VSignInController instance = Get.find();
  GetStorage box = GetStorage();

  //TODO: Toggle Varible
  bool obscurePassword = true;

  //TODO: InputFields Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //TODO: Error Variables
  String emailError = '';
  String passwordError = '';

  //TODO: Pasword Toggle
  void passwordToggle() {
    obscurePassword = !obscurePassword;
    update();
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Email':
        emailError = Validators.emailValidator(value) ?? '';
        update();
        return emailError;
      case 'password':
        passwordError = Validators.passwordValidator(value) ?? '';
        update();
        return passwordError;
      default:
        return '';
    }
  }

  //TODO: BUTTON VALIDATION
  Future<bool> validateForm() async {
    final emailErrorString = validateFields('Email', emailController.text);
    final passwordErrorString =
        validateFields('password', passwordController.text);
    return emailErrorString.isEmpty && passwordErrorString.isEmpty;
  }

  //TODO: Sign In Function
  login() async {
    if (await validateForm()) {
      var response = await VSignInApi.login(
          email: emailController.text, password: passwordController.text);
      if (response.isNotEmpty) {
        box.write('api_token', response['garage']['token']);
        box.write('user_type', 'vendor');
        Get.offAllNamed(AppRoutes.vhome);
      }
    } else {
      UiUtilites.pendingApprovalAlertDialog(
        context: Get.context!,
        imageAssetPath: 'assets/icons/warning.svg',
        onTap: () {},
        description: 'Fill out all details required!'.tr,
      );
    }
  }
}
