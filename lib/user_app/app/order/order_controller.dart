// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

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
///////////
///
  int activestatus = 2;

   List<StepperData> get stepperData => [
        StepperData(
            // title: StepperText(
            //   "Accepted",
            //   textStyle: const TextStyle(
            //       color: AppColors.lightgreen,
            //       fontSize: 10,
            //       fontWeight: FontWeight.w500),
            // ),
            title: StepperText('text'),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: AppColors.lightgreen,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture .asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
        StepperData(
            title: StepperText(
              "On the way",
              textStyle: TextStyle(
                  color: activestatus != 1
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: activestatus != 1
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
        StepperData(
            title: StepperText(
              "Delivered",
              textStyle: TextStyle(
                  color: activestatus == 2
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            iconWidget: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: activestatus == 2
                      ? AppColors.lightgreen
                      : AppColors.greybg,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/check-circlewhite.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            )),
      ];
}
