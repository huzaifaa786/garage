import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/helper/validators.dart';

class ChangePhonenumberController extends GetxController {
  static ChangePhonenumberController instance = Get.find();

  TextEditingController phoneController = TextEditingController();

  String phoneError = '';

  PhoneNumber? checkphoneController;
  String? completePhoneNumber;
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");

  //TODO: Start Phone Validation
  onCountryChanged(Country value) {
    selectedCountry = value;
    phoneController.clear();
    update();
    if (checkphoneController != null) phoneValidation(checkphoneController);
  }

  phoneValidation(phone) {
    if (!isNumeric(phone.number)) {
      phoneError = 'Use Numeric Variables'.tr;
      update();
      return phoneError;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      phoneError = 'Invalid Phone Number'.tr;
      update();
      return phoneError;
    } else {
      phoneError = '';
    }
    checkphoneController = phone;
    update();
    if (countries
            .firstWhere((element) => element.code == phone!.countryISOCode)
            .maxLength ==
        phone!.number.length) {
      completePhoneNumber = phone.completeNumber;
      update();
    } else {
      completePhoneNumber = null;
    }
    return phoneError;
  }

  changeNumber() async {
    if (await validateForm()) {
      Get.toNamed(AppRoutes.otp, parameters: {
        'phone': completePhoneNumber.toString(),
        'auth': 'changeNumber'
      });
    }
  }

  // input field validation
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'phone':
        phoneError = Validators.emptyStringValidator(value, fieldName.tr) ?? '';
        update();
        return phoneError;
      default:
        return '';
    }
  }
// form validation

  Future<bool> validateForm() async {
    final phoneErrorString = validateFields('phone', phoneController.text);
    return phoneErrorString.isEmpty;
  }

  // UserModel? user;
  // void onSaveChanges() async {
  //   var response =
  //       await EditProfileApi.editProfile(phone: phoneController.text);
  //   if (response.isNotEmpty) {
  //     user = UserModel.fromJson(response['user']);
  //   }
  //   update();
  //   Get.back();
  // }
}
