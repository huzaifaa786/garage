import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/my_cars_apis/my_cars_api.dart';
import 'package:mobilegarage/services/uservehicles_service.dart';

class MyCarsControllers extends GetxController {
  static MyCarsControllers instance = Get.find();

  bool isLoading = false;

  List<Map<String, dynamic>> vehicleSections = [];

  Future<void> fetchUserVehicles(int userId) async {
    try {
      isLoading = true;
      update();

      var response = await UserVehiclesService.getUserVehicles();

      if (response['data'] != null) {
        List<dynamic> vehicleData = response['data'];

        vehicleSections.clear();
        for (var vehicle in vehicleData) {
          vehicleSections.add({
            'vehicleDetailController': TextEditingController(),
            'selectedVehicle': vehicle['name'] ?? 'Unknown Vehicle',
            'vehicleImage': vehicle['image'] ?? '',
          });
        }
      }
    } catch (e) {
      print('Error fetching user vehicles: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  void addVehicleSection() {
    vehicleSections.add({
      'vehicleDetailController': TextEditingController(),
      'selectedVehicle': 'Car',
      'vehicleImage': null,
    });
    update();
  }

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

  String? selectedValue;
  List<Map<String, dynamic>> radioButton = [
    {
      "id": "1",
      "imageUrl": "https://dummyimage.com/50x50/000/fff",
      "radioTitle": "white Mercedes 2022",
      "deleteOnTap": () {},
    },
    {
      "id": "2",
      "imageUrl": "https://dummyimage.com/50x50/000/fff",
      "radioTitle": "white Mercedes 2022",
      "deleteOnTap": () {},
    },
  ];
}
//
 