// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signin_apis/login_verify_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signin_apis/verify_number_api.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class SigninController extends GetxController {
  static SigninController instance = Get.find();
  TextEditingController phoneController = TextEditingController();
  // String phone1 = '';
  // String? completePhone;
  // bool isCompleteNumber = false;
  // // String? phoneError = '';
  // onChanged(PhoneNumber phone) {
  //   if (countries
  //           .firstWhere((element) => element.code == phone.countryISOCode)
  //           .maxLength ==
  //       phone.number.length) {
  //     phone1 = phone.number;
  //     completePhone = phone.completeNumber;
  //     isCompleteNumber = true;
  //     update();
  //   } else {
  //     completePhone = '';
  //     isCompleteNumber = false;
  //     update();
  //   }
  // }

  ///
  var isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;

    update();
  }

  verifyNumber() async {
    var response = await VerifyNumberApi.verifyNumber(
        phone: checkphoneController.toString());
    if (response.isNotEmpty) {
      Get.toNamed(AppRoutes.otp, parameters: {
        'phone': checkphoneController.toString(),
        'auth': 'signin'
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoutes.signup);
      });
    }
  }

// phone
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

  String phoneError = '';

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

  String? otp = '';
  login() async {
    GetStorage box = GetStorage();
    // var response = await VerifyNumberApi.verifyNumber(phone: completePhone);
    if (isChecked == true) {
      box.write('isRemember', true);
      box.write('rememberedPhone', phoneController.text);
    } else {
      box.remove('isRemember');
      box.remove('rememberedPhone');
    }
    // var response = await LoginVerifyApi.verifyNumber(
    //     phone: completePhoneNumber.toString());
    // if (response.isNotEmpty) {
    //   otp = response['user']['otp'].toString();

    Get.toNamed(AppRoutes.otp, parameters: {
      'phone': completePhoneNumber.toString(),
      // 'auth': 'signin',
      // 'otp': otp.toString()
    });
    // } else {
    //   Future.delayed(Duration(seconds: 1), () {
    //     Get.toNamed(AppRoutes.signup);
    //   });
  }
}

  // @override
  // void onInit() {
  //   GetStorage box = GetStorage();
  //   if (box.read('isRemember') == true) {
  //     phoneController.text = box.read('rememberedPhone');
  //     isChecked = true;
  //     update();
  //   }
  //   super.onInit();}
  
