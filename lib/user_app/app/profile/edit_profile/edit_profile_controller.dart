import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class EditProfileController extends GetxController {
  static EditProfileController instance = Get.find();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File? cameraImage;
  final picker = ImagePicker();

    @override
  void onInit() {
    super.onInit();
    receiveArguments();
  }

 
  void receiveArguments() {
    
    var args = Get.arguments;
    if (args != null) {
      nameController.text = args['userName'] ?? '';
      phoneController.text = args['userNumber'] ?? '';
    }
  }

  selectCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      // return File(pickedFile.path);
      cameraImage = File(pickedFile.path);
      update();
    }
  }
}
