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
   List<File> newImages = [];
   List<String> base64Images = [];

    selectMultiImage() async {
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      for (var element in pickedFiles) {
        newImages.add(File(element.path));
      }
      update();
   
     }
  }


  selectCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      // return File(pickedFile.path);
      cameraImage = File(pickedFile.path);
      update();
    } 
  }

} 
