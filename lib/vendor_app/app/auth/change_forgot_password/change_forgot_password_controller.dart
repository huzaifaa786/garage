import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/vender_apis/auth/forgot_password_apis/forgot_password_api.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';

class VChangeForgotPasswordController extends GetxController {
  static VChangeForgotPasswordController instance = Get.find();
  GetStorage box = GetStorage();

  //TODO: InputFields Controllers
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //TODO: Error Variables
  String passwordError = '';
  String confirmPasswordError = '';

  //TODO: Toggle Varible
  bool obscurePassword = true;
  bool cobscurePassword = true;

  //TODO: Pasword Toggle
  void passwordToggle() {
    obscurePassword = !obscurePassword;
    update();
  }

  //TODO: Confirm Pasword Toggle
  void confirmPasswordToggle() {
    cobscurePassword = !cobscurePassword;
    update();
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'password':
        passwordError = Validators.passwordValidator(value) ?? '';
        update();
        return passwordError;
      case 'confirm_password':
        confirmPasswordError = Validators.confrimPasswordValidator(
                passwordController.text, value) ??
            '';
        update();
        return confirmPasswordError;
      default:
        return '';
    }
  }

  //TODO: FORGOT VALIDATION
  Future<bool> validateForm() async {
    final passwordErrorString =
        validateFields('password', passwordController.text);
    final confirmPasswordErrorString =
        validateFields('confirm_password', confirmPasswordController.text);
    return passwordErrorString.isEmpty && confirmPasswordErrorString.isEmpty;
  }
  String? email='';
 @override
  void onInit() {
    super.onInit();
    email = Get.parameters['email'];
  }
  //TODO: Forgot Function
  forgot() async {
    if (await validateForm()) {
      var response = await VForgotPasswordApi.updatepassword(
        email: email.toString(), password: passwordController.text);
    if (response.isNotEmpty) {
      Get.offAllNamed(
        AppRoutes.signin,
      );}
    }
  }
}
