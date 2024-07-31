import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignupController extends GetxController {
  static SignupController innstanse = Get.find();
  TextEditingController phoneController = TextEditingController();
  String phone1 = '';
  String? completePhone;
  bool isCompleteNumber = false;
 onChanged(PhoneNumber phone) {
    if (countries
            .firstWhere((element) => element.code == phone.countryISOCode)
            .maxLength ==
        phone.number.length) {
      phone1 = phone.number;
      completePhone = phone.completeNumber;
      isCompleteNumber = true;
      update();
    } else {
      completePhone = '';
      isCompleteNumber = false;
      update();
    }
  }
}
