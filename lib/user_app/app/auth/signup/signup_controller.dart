// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';

class SignupController extends GetxController {
  static SignupController innstanse = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController emirateController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();
  // TextEditingController vechiledetailController = TextEditingController();

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
 //TODO: Register Function
  register() async {
    if (await validateForm()) {
      print('object');
    }}

 //TODO: Error Variables
  String nameError = '';

String validateFields(String fieldName , value){
  switch(fieldName){
    case 'name':
    nameError =Validators.emptyStringValidator(value, fieldName) ?? '';
    update();
    return nameError;
     default:
        return '';
  }
}

  Future<bool> validateForm() async {
    final nameErrorString = validateFields('Name', nameController.text);
 return nameErrorString.isEmpty;

  }

///////////////
  // Position? currentPosition;
  // GetStorage box = GetStorage();
  // double? lat;
  // double? lng;
  // String currentAddress = '';
  /////////////////////////////////////////

  // final List<Map<String, String>> cars = [
  //   {'name': 'Car', 'iconPath': 'assets/images/car.png'},
  //   {'name': 'Van', 'iconPath': 'assets/images/van.png'},
  //   {'name': 'Bike', 'iconPath': 'assets/images/bike.png'},
  //   {'name': 'Van1', 'iconPath': 'assets/images/van.png'},
  //   {'name': 'Bike1', 'iconPath': 'assets/images/bike.png'},
  //   {'name': 'Car1', 'iconPath': 'assets/images/car.png'},
  //   {'name': 'Car2', 'iconPath': 'assets/images/car.png'},
  //   {'name': 'Van2', 'iconPath': 'assets/images/van.png'},
  //   {'name': 'Bike2', 'iconPath': 'assets/images/bike.png'},
  //   // Add more cars as needed
  // ];

  // List<Map<String, dynamic>> vehicleSections = [
  //   {
  //     'vehicleDetailController': TextEditingController(),
  //     'selectedVehicle': 'Car',
  //     'vehicleImage': null,
  //   }
  // ];
  // void addVehicleSection() {
  //   vehicleSections.add({
  //     'vehicleDetailController': TextEditingController(),
  //     'selectedVehicle': 'Car',
  //     'vehicleImage': null,
  //   });
  //   update();
  // }

  // void removeVehicleSection(int index) {
  //   vehicleSections.removeAt(index);
  //   update();
  // }

  // void selectVehicle(int index, String vehicleName) {
  //   vehicleSections[index]['selectedVehicle'] = vehicleName;
  //   update();
  // }

  // Future<void> selectVehicleImage(int index) async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     vehicleSections[index]['vehicleImage'] = pickedFile.path;
  //     update();
  //   } else {
  //     print('No image selected.');
  //   }
  // }

  // void removeVehicleImage(int index) {
  //   vehicleSections[index]['vehicleImage'] = null;
  //   update();
  // }

  // bool isImageSelected(int index) {
  //   return vehicleSections[index]['vehicleImage'] != null;
  // }
  //
  // var selectedVehicle = 'Car';
  // String getVehicleType(String vehicleName) {
  //   return selectedVehicle == vehicleName ? vehicleName : '';
  // }

  // // Method to select a vehicle type
  // void selectVehicle(String vehicleName) {
  //   selectedVehicle = vehicleName;
  //   update();
  // }

  /////////////////////////
  // Select Image and Assign to Respective Variable
  // final picker = ImagePicker();
  // String? firstvechileImage;

  // selectvechileImage(String imageType) async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     switch (imageType) {
  //       case 'firstvehicle':
  //         firstvechileImage = pickedFile.path;
  //         break;
  //       // case 'documents':
  //       //   documents = pickedFile.path;
  //       //   break;
  //       default:
  //         print('Invalid image type');
  //         return;
  //     }
  //     update();
  //   } else {
  //     print('No image selected.');
  //   }
  //   update();
  // }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getEmirates();
  }

  String emirateError = '';

  //TODO: DropDown Varible
  EmirateModel? selectedEmirate;
  List<EmirateModel> emirates = [];
  int? selectedEmirateId;
  getEmirates() async {
    var response = await VGetEmirates.getEmirats();
    if (response.isNotEmpty) {
      emirates = (response['emirates'] as List<dynamic>)
          .map((item) => EmirateModel.from(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  void setSelectedEmirate(EmirateModel? emirate) {
    selectedEmirate = emirate;
    selectedEmirateId = emirate?.id;
    update();
  }
  // Check if Image is Selected
  // bool isImageSelected(String imageType) {
  //   switch (imageType) {
  //     case 'firstvehicle':
  //       return firstvechileImage != null;
  //     // case 'documents':
  //     //   return documents != null;
  //     default:
  //       return false;
  //   }
  // }

  //////////////////////////////////////
  // void removeVehicleImage(String imageType) {
  //   switch (imageType) {
  //     case 'firstvehicle':
  //       firstvechileImage = null;
  //       break;
  //     default:
  //       print('Invalid image type');
  //       return;
  //   }
  //   update();
  // }
  //////////////////////////////////
}
