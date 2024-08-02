import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  final picker = ImagePicker();
  String? vehicleImage;
  String? vehicleImageBase64;

  // Convert Image to Base64
  String? convertImageToBase64(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  // Select Image
  Future<void> selectVehicleImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      vehicleImage = pickedFile.path;
      vehicleImageBase64 = convertImageToBase64(vehicleImage!);
      update();
    } else {
      print('No image selected.');
    }
  }

  // Check if Image is Selected
  bool isImageSelected() {
    return vehicleImage != null;
  }
}
