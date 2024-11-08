import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/edit_profile_apis/change_password_api.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VChangepasswordController extends GetxController {
  static VChangepasswordController instance = Get.find();

  TextEditingController passwordController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String passwordError = '';
  String newpasswordError = '';
  String confirmPasswordError = '';

  bool obscurePassword = true;
  bool cobscurePassword = true;
  bool obscureOldPassword = true;

  bool color = false;
  var isButtonClicked = false;
  void onSaveChanges() async {
    if (await validateform()) {
      var response = await VChangePasswordApi.changePassword(
          password: oldpasswordController.text,
          newpassword: passwordController.text);
      if (response.isNotEmpty) {
        isButtonClicked = true;
        update();
        UiUtilites.successSnackbar('Password updated successfully'.tr, 'Success'.tr);
        Get.back();
      }
    }
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
        newpasswordError = Validators.passwordValidator(value) ?? '';
        update();
        return newpasswordError;
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

  // button validation
  Future<bool> validateform() async {
    final oldpasswordErrorString =
        validateFields('old_password', oldpasswordController.text);
    final passwordErrorString =
        validateFields('password', passwordController.text);
    final confirmpasswordErrorString =
        validateFields('confirm_password', confirmPasswordController.text);
    return oldpasswordErrorString.isEmpty &&
        passwordErrorString.isEmpty &&
        confirmpasswordErrorString.isEmpty;
  }
}
