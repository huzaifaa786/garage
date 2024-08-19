import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';

class VChangepasswordController extends GetxController {
  static VChangepasswordController instance = Get.find();

  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String passwordError = '';
  String confirmPasswordError = '';

  bool obscurePassword = true;
  bool cobscurePassword = true;
  bool obscureOldPassword = true;

  bool color = false;


 var isButtonClicked = false;

  void onSaveChanges() {
    print(isButtonClicked);
    isButtonClicked = true;

    update();
  }
  void passwordToggle() {
    obscurePassword = !obscurePassword;
    update();
  }

  void confirmPasswordToggle() {
    cobscurePassword = !cobscurePassword;
    update();
  }

  void oldPasswordToggle() {
    obscureOldPassword = !obscureOldPassword;
    update();
  }

  //TODO: INPUT VALIDATIONS
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'old_password':
        passwordError = Validators.passwordValidator(value) ?? '';
        update();
        return passwordError;
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
}
