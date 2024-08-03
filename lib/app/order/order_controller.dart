// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/app/home/home_controller.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  TextEditingController priceController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  final picker = ImagePicker();
  String? vehicleImage;
  String? vehicleImageBase64;
  String? selectedValue;
  int get itemCount => services.length;
  static double itemHeight = Get.height * 0.04;

  double get listHeight {
    return services.length * (itemHeight);
  }

  // Check if Image is Selected
  bool isImageSelected() {
    return vehicleImage != null;
  }

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

  //! ListView.builder

  var services = <ServiceItem>[
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Road Service',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Maintenance',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Battery',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Car wash',
    ),
    ServiceItem(
      imageUrl: 'https://dummyimage.com/70x70/000/fff',
      text: 'Oil change',
    ),
  ];

  final List<Map<String, String>> items = [
    {'id': 'vehicle1', 'text': 'Toyota Lexus'},
    {'id': 'vehicle2', 'text': 'Honda Civic'},
    {'id': 'vehicle3', 'text': 'Ford Raptor'},
    {'id': 'vehicle4', 'text': 'GMC'},
    {'id': 'vehicle5', 'text': 'Range Rover'},
  ];
}
