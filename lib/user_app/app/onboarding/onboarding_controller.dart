import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnboardingController extends GetxController {
  static OnboardingController instance = Get.find();
  PageController? pgecontroller;
  int slideIndex = 0;
  @override
  void onInit() {
    pgecontroller = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pgecontroller?.dispose();
    super.onClose();
  }

  void updateSlideIndex(int index) {
    slideIndex = index;
    update();
  }

  void nextPage() {
    if (slideIndex < 2) {
      slideIndex++;
      pgecontroller!.animateToPage(
        slideIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      update();
    }
  }
}
