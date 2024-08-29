// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';

class SignupController extends GetxController {
  static SignupController innstanse = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();

// onint

 @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getEmirates();
  }

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

// phone 
  PhoneNumber? checkphoneController;
  String? completePhoneNumber;
  Country? selectedCountry =
      countries.firstWhere((country) => country.fullCountryCode == "971");

  //TODO: Start Phone Validation
  onCountryChanged(Country value) {
    selectedCountry = value;
    phoneController.clear();
    update();
    if (checkphoneController != null) phoneValidation(checkphoneController);
  }

  phoneValidation(phone) {
    if (!isNumeric(phone.number)) {
      phoneError = 'Use Numeric Variables';
      update();
      return phoneError;
    } else if (phone.number.length < selectedCountry!.minLength ||
        phone.number.length > selectedCountry!.maxLength) {
      phoneError = 'Invalid Phone Number'.tr;
      update();
      return phoneError;
    } else {
      phoneError = '';
    }
    checkphoneController = phone;
    update();
    if (countries
            .firstWhere((element) => element.code == phone!.countryISOCode)
            .maxLength ==
        phone!.number.length) {
      completePhoneNumber = phone.completeNumber;
      update();
    } else {
      completePhoneNumber = null;
    }
    return phoneError;
  }


  //TODO: Register Function
  register() async {
    if (await validateForm()) {
      Get.toNamed(AppRoutes.cardetails);
    }
  }

  //TODO: Error Variables
  String nameError = '';
  String emirateError = '';
  String phoneError = '';
  String addressdetailError = '';

// input field validation 
  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'name':
        nameError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return nameError;
      case 'phone':
        phoneError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return phoneError;
      case 'Emirate':
        emirateError = Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return emirateError;
      case 'address detail':
        addressdetailError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return addressdetailError;
      default:
        return '';
    }
  }

// form validation
  Future<bool> validateForm() async {
    final nameErrorString = validateFields('name', nameController.text);
    final phoneErrorString = validateFields('phone', phoneController.text);
    final addressdetailErrorString =
        validateFields('address detail', adreesdetailController.text);

    if (selectedEmirateId == null) {
      emirateError = 'Please select an emirate';
      update();
    } else {
      emirateError = '';
      update();
    }
    return nameErrorString.isEmpty &&
        phoneErrorString.isEmpty &&
        emirateError.isEmpty &&
        addressdetailErrorString.isEmpty;
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
