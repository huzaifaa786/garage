import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/utils/ui_utils/ui_utils.dart';

class MyCarsControllers extends GetxController {
  static MyCarsControllers instance = Get.find();
  String? selectedValue;
  List<Map<String, dynamic>> radioButton = [
    {
      "id": "1",
      "imageUrl": "https://dummyimage.com/50x50/000/fff",
      "radioTitle": "white Mercedes 2022",
      "deleteOnTap": () {
        
      },
    },
    {
      "id": "2",
      "imageUrl": "https://dummyimage.com/50x50/000/fff",
      "radioTitle": "white Mercedes 2022",
      "deleteOnTap": () {},
    },
  ];
  void removeVehicleSection(int index) {
    vehicleSections.removeAt(index);
    update();
  }

  void removeVehicleImage(int index) {
    vehicleSections[index]['vehicleImage'] = null;
    update();
  }

  void selectVehicle(int index, String vehicleName) {
    vehicleSections[index]['selectedVehicle'] = vehicleName;
    update();
  }

  Future<void> selectVehicleImage(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      vehicleSections[index]['vehicleImage'] = pickedFile.path;
      update();
    } else {
      print('No image selected.');
    }
  }

  bool isImageSelected(int index) {
    return vehicleSections[index]['vehicleImage'] != null;
  }

  List<Map<String, dynamic>> vehicleSections = [{}];
  void addVehicleSection() {
    vehicleSections.add({
      'vehicleDetailController': TextEditingController(),
      'selectedVehicle': 'Car',
      'vehicleImage': null,
    });
    update();
  }
}
