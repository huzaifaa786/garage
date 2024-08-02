import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:geolocator/geolocator.dart';

class SignupController extends GetxController {
  static SignupController innstanse = Get.find();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emirateController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();
///////////////////////////////////////
  String phone1 = '';
  String? completePhone;
  bool isCompleteNumber = false;
  onChanged(PhoneNumber phone) {
    if (countries
            .firstWhere((element) => element.code == phone.countryISOCode)
            .maxLength ==
        phone.number.length) {
      phone1 = phone.number;
      completePhone = phone.completeNumber;
      isCompleteNumber = true;
      update();
    } else {
      completePhone = '';
      isCompleteNumber = false;
      update();
    }
  }

  /////////////////
  List<String> citiesList = [
    'Dubai',
    'Abu Dhabi',
    'Fujairah',
    'Ras Al Khaimah',
    'Sharjah',
    'Umm Al Quwain',
    'Ajman',
    'Western Region',
  ];
///////////////
  Position? currentPosition;
  GetStorage box = GetStorage();
  double? lat;
  double? lng;
  String currentAddress = '';
  /////////////////////////////////////////

  final List<Map<String, String>> cars = [
    {'name': 'Car', 'iconPath': 'assets/images/car.png'},
    {'name': 'Van', 'iconPath': 'assets/images/van.png'},
    {'name': 'Bike', 'iconPath': 'assets/images/bike.png'},
    {'name': 'Van1', 'iconPath': 'assets/images/van.png'},
    {'name': 'Bike1', 'iconPath': 'assets/images/bike.png'},
    {'name': 'Car1', 'iconPath': 'assets/images/car.png'},
    {'name': 'Car2', 'iconPath': 'assets/images/car.png'},
    {'name': 'Van2', 'iconPath': 'assets/images/van.png'},
    {'name': 'Bike2', 'iconPath': 'assets/images/bike.png'},
    // Add more cars as needed
  ];
  var selectedVehicle = 'Car';
  String getVehicleType(String vehicleName) {
    return selectedVehicle == vehicleName ? vehicleName : '';
  }

  // Method to select a vehicle type
  void selectVehicle(String vehicleName) {
    selectedVehicle = vehicleName;
    update();
  }
}
