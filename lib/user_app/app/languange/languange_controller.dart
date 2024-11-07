import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/components/enums/enums.dart';

class LanguagesController extends GetxController {
  static LanguagesController get instance => Get.find();

  String language = 'english'.tr;
  translateMethod? site;
  toggleplan(translateMethod value) {
    site = value;
    update();
  }

  @override
  void onInit() {
    GetStorage box = GetStorage();
    site = box.read('locale') != 'ar'
        ? translateMethod.English
        : translateMethod.Arabic;
    update();
    // language = site == translateMethod.English ? 'english' : 'Arabic';
    // update();
    super.onInit();
  }

  // int selectedLanguage = 0;

  // void changeLanguage(int index) {
  //   selectedLanguage = index;
  //   update();
  // }

  // // Method to get the color based on the selection state
  // Color getRadioColor(int value) {
  //   return value == selectedLanguage
  //       ? AppColors.primary_color
  //       : AppColors.primary_color;
  // }
}
