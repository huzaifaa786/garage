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
import 'package:mobilegarage/user_app/app/auth/signin/number_formater.dart';

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
        'auth': 'signin',
        "otp":"otp"
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
    print('phone: $phone');
    if (!isNumeric(phone.number)) {
      phoneError = 'Use Numeric Variables'.tr;
      completePhoneNumber = null;
      update();
      return phoneError;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      phoneError = 'Invalid Phone Number'.tr;
      completePhoneNumber = null;
      update();
      return phoneError;
    } else {
      phoneError = '';
    }

    checkphoneController = phone;
    if (countries
            .firstWhere((element) => element.code == phone!.countryISOCode)
            .maxLength ==
        phone!.number.length) {
      completePhoneNumber = phone.completeNumber;
      update();
    }
    return phoneError;
  }

  String? otp = '';
  login() async {
    GetStorage box = GetStorage();
    var response = await LoginVerifyApi.verifyNumber(
        phone: completePhoneNumber.toString());

    print(completePhoneNumber);
    if (response.isNotEmpty) {
      if (isChecked == true) {
        String countryCode = parsePhoneNumber('$completePhoneNumber');
        box.write('isRemember', true);
        box.write('rememberedPhone', phoneController.text);
        box.write('rememberedPhoneCode', countryCode);
      } else {
        box.remove('isRemember');
        box.remove('rememberedPhone');
        box.remove('rememberedPhoneCode');
      }
      Get.toNamed(AppRoutes.otp, parameters: {
        'phone': completePhoneNumber.toString(),
        'auth': 'signin',  
      });
    }
  }

  String? initialCode;

  @override
  void onInit() {
    GetStorage box = GetStorage();
    String? i = box.read('rememberedPhoneCode');
    if (i != null && i.isNotEmpty) {
      selectedCountry =
          countries.firstWhere((country) => country.fullCountryCode == "$i");
      update();
    }
    initialCode = selectedCountry!.code;
    if (box.read('isRemember') == true) {
      String countryCode = parsePhoneNumber(
          '+${box.read('rememberedPhoneCode')}${box.read('rememberedPhone')}');
      String isoCode = phoneNumberIsoCode(
          '+${box.read('rememberedPhoneCode')}${box.read('rememberedPhone')}');

      phoneValidation(
        PhoneNumber(
          countryCode: '+$countryCode',
          countryISOCode: isoCode,
          number: box.read('rememberedPhone'),
        ),
      );
      phoneController.text = box.read('rememberedPhone');
      isChecked = true;
    }
    update();
    super.onInit();
  }
}
