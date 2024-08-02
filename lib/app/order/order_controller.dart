import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  // TextEditingController serviceController = TextEditingController();

  final picker = ImagePicker();
  String? vechileImage;


 // Convert Image to Base64
  String? convertImageToBase64(String? imagePath) {
    if (imagePath == null) return null;

    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }


  selectvechileImage(String imageType) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      switch (imageType) {
        case 'vehicle':
          vechileImage = pickedFile.path;
          break;
      }
      update();
    } else {
      print('No image selected.');
    }
    update();
  }
}

// bool isImageSelected(String imageType) {
//   switch (imageType) {
//     case 'vehicle':
//       return vechileImage != null;
//          default:
//         return false;
//   }
// }
//  String? vehicleImageBase64 = convertImageToBase64(vechileImage);
