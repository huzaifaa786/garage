// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/car_brand_name_api/get_brand_name_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/car_brands_api/get_Car_Brand_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/signup_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/vechiles_api/get_vechile_api.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/brand_name_model.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/models/vehicle_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class SignupController extends GetxController {
  static SignupController innstanse = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();

GetStorage box =GetStorage();

// onint
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getEmirates();
    await getVehicles();
    await addVehicleSection();
    await initializeTextControllers();
  }

  //TODO: DropDown Varible
  EmirateModel? selectedEmirate;
  List<EmirateModel> emirates = [];
  int? selectedEmirateId;
  String? selectedemirateName;
  getEmirates() async {
    var response = await VGetEmirates.getEmirats();
    if (response.isNotEmpty) {
      emirates = (response['emirates'] as List<dynamic>)
          .map((item) => EmirateModel.from(item as Map<String, dynamic>))
          .toList();
      update();
    }
  }

  void setSelectedEmirate(EmirateModel? Brand) {
    selectedEmirate = Brand;
    selectedEmirateId = Brand?.id;
    selectedemirateName = Brand?.name;
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
      emirateError = 'Please select an Brand';
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
///////////////////////////      CAR DETAIL DATA                           //////////////////////////////////////////
///////////////////////////      CAR DETAIL DATA                           //////////////////////////////////////////
///////////////////////////      CAR DETAIL DATA                           //////////////////////////////////////////

// select vehicle drop down

  List<VehicleModel> vehilcles = [];
  int? selectedVehicleId;
  getVehicles() async {
    var response = await GetVechileApi.getVechiles();
    if (response.isNotEmpty) {
      vehilcles = (response['vehicletypes'] as List<dynamic>)
          .map((item) => VehicleModel.from(item as Map<String, dynamic>))
          .toList();
      update();
    }
  }

  void setSelectedVehicle(int index, VehicleModel? Brand) async {
    selectedVehicleId = Brand?.id;
    vehicleSections[index]['vehicletype_id'] = Brand;
    vehicleSections[index]['vehiclebrand_id'] = null;
    vehicleSections[index]['vehiclebrandname_id'] = null;

    if (Brand != null) {
      selectedVehicleId = Brand.id;
      await getBrands(index);
    }
    update();
  }

// slecr brand  drop down

  int? selectedVehiclebrandId;
  getBrands(int index) async {
    var response = await GetCarBrandApi.getBrands(
        vehicleSections[index]['vehicletype_id']?.id.toString());
    if (response.isNotEmpty) {
      vehicleSections[index]['brands'] =
          (response['vehiclebrands'] as List<dynamic>)
              .map((item) => BrandModel.from(item as Map<String, dynamic>))
              .toList();
      update();
    }
  }

  void setSelectedVehicleBrand(int index, BrandModel? vehicleBrand) async {
    selectedVehiclebrandId = vehicleBrand?.id;
    vehicleSections[index]['vehiclebrand_id'] = vehicleBrand;
    vehicleSections[index]['vehiclebrandname_id'] = null;

    if (vehicleBrand != null) {
      await getBrandName(index);
    }
    update();
  }

// slecr brand name drop down

  int? selectedbrandNameId;
  getBrandName(int index) async {
    var response = await GetCarBrandNameApi.getVechilesBrandName(
        vehicleSections[index]['vehiclebrand_id']?.id.toString());
    if (response.isNotEmpty && response['vehiclebrandnames'] != []) {
      print('object');
      vehicleSections[index]['brandnames'] =
          (response['vehiclebrandnames'] as List<dynamic>)
              .map((item) => BrandNameModel.from(item as Map<String, dynamic>))
              .toList();
      update();
    }
  }

  void setSelectedBrandName(int index, BrandNameModel? BrandName) {
    selectedbrandNameId = BrandName?.id;
    vehicleSections[index]['vehiclebrandname_id'] = BrandName;

    update();
  }

  ///   register api
  registerUser() async {
    List<Map<String, dynamic>> formattedVehicleSections =
        vehicleSections.map((section) {
      String? imageBase64;

      if (section['image'] != null) {
        String filePath = section['image'] as String;
        File imageFile = File(filePath);
        List<int> imageBytes = imageFile.readAsBytesSync();
        imageBase64 = base64Encode(imageBytes);
      }
      return {
        'vehicletype_id': section['vehicletype_id']?.id ?? null,
        'vehiclebrand_id': section['vehiclebrand_id']?.id ?? null,
        'vehiclebrandname_id': section['vehiclebrandname_id']?.id ?? null,
        'year_of_manufacture': section['year_of_manufacture'] ?? '',
        'vehicle_info': section['vehicle_info'] ?? '',
        'image': imageBase64,
      };
    }).toList();

    var response = await SignupApi.registerUser(
      name: nameController.text,
      phone: completePhoneNumber.toString(),
      emirate: selectedemirateName,
      addressdetail: adreesdetailController.text,
      includes: formattedVehicleSections,
    );
    if (response.isNotEmpty) {
       box.write('api_token', response['user']['token']);
      Get.toNamed(AppRoutes.otp,
          parameters: {'phone': completePhoneNumber.toString(),'auth':'signup'});
      update();
    }
  }

///////////////
///////////////

  final Map<int, TextEditingController> yearOfManufactureControllers = {};
  final Map<int, TextEditingController> carInfoControllers = {};

  initializeTextControllers() {
    final controller = Get.find<SignupController>();
    for (int i = 0; i < controller.vehicleSections.length; i++) {
      yearOfManufactureControllers[i] = TextEditingController(
          text:
              controller.vehicleSections[i]['year_of_manufacture'] as String? ??
                  '');
      carInfoControllers[i] = TextEditingController(
          text: controller.vehicleSections[i]['vehicle_info'] as String? ?? '');
    }
  }

  List<Map<String, dynamic>> vehicleSections = [];
  addVehicleSection() async {
    vehicleSections.add({
      'vehicletype_id': null,
      'vehiclebrand_id': null,
      'vehiclebrandname_id': null,
      'year_of_manufacture': '',
      'vehicle_info': '',
      'image': null,
    });
    update();
  }

  Map<int, Map<String, String>> sectionErrors = {};

  bool validateAllVehicleSections() {
    bool isValid = true;
    sectionErrors.clear();
    for (int index = 0; index < vehicleSections.length; index++) {
      // var errors = sectionErrors[index];
      final section = vehicleSections[index];
      final errors = <String, String>{};
      // Validate vehicle type
      if (section['vehicletype_id'] == null) {
        errors['vehicletype'] = 'Please select a vehicle type';
        isValid = false;
      }

      // Validate vehicle brand
      if (section['vehiclebrand_id'] == null) {
        errors['vehiclebrand'] = 'Please select a vehicle brand';
        isValid = false;
      }

      // Validate vehicle brand name
      if (section['vehiclebrandname_id'] == null) {
        errors['vehiclebrandname'] = 'Please select a vehicle brand name';
        isValid = false;
      }

      // Validate year of manufacture
      if (section['year_of_manufacture']?.isEmpty ?? true) {
        errors['year_of_manufacture'] = 'Please enter the year of manufacture';
        isValid = false;
      }

      // Validate vehicle information
      if (section['vehicle_info']?.isEmpty ?? true) {
        errors['vehicle_info'] = 'Please enter vehicle information';
        isValid = false;
      }
      // Validate image
      if (section['image'] == null) {
        errors['image'] = 'Please select an image';
        isValid = false;
      }
      // Store errors for this section
      if (errors.isNotEmpty) {
        sectionErrors[index] = errors;
      }
    }

    update();
    return isValid;
  }

// car detail view error variables
  String vehicletypeerror = '';
  String vehiclebranderror = '';
  String vehiclebrandnameerror = '';
  String yearmanufactureerror = '';
  String vehicleinfoerror = '';
  String imgerror = '';

  String validateCarFields(String fieldName, value) {
    switch (fieldName) {
      case 'vehicletype':
        vehicletypeerror =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return vehicletypeerror;
      case 'vehiclebrand':
        vehiclebranderror =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return vehiclebranderror;
      case 'vehiclebrandname':
        vehiclebrandnameerror =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return vehiclebrandnameerror;
      case 'year_of_manufacture':
        yearmanufactureerror =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return yearmanufactureerror;
      case 'vehicle_info':
        vehicleinfoerror =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return vehicleinfoerror;

      default:
        return '';
    }
  }

  Future<bool> validateCarForm() async {
    bool isFormValid = true;

    // Validate form fields
    if (selectedVehicleId == null) {
      vehicletypeerror = 'Please select a vehicle';
      isFormValid = false;
    } else {
      vehicletypeerror = '';
    }

    if (selectedVehiclebrandId == null) {
      vehiclebranderror = 'Please select a brand';
      isFormValid = false;
    } else {
      vehiclebranderror = '';
    }

    if (selectedbrandNameId == null) {
      vehiclebrandnameerror = 'Please select a brand name';
      isFormValid = false;
    } else {
      vehiclebrandnameerror = '';
    }

    // Validate all vehicle sections
    bool allSectionsValid = validateAllVehicleSections();
    isFormValid = isFormValid && allSectionsValid;

    // Display a snackbar if any section is missing an image
    if (!isFormValid) {
      for (int index = 0; index < sectionErrors.length; index++) {
        var errors = sectionErrors[index];
        if (errors != null && errors.containsKey('image')) {
          UiUtilites.errorSnackbar('error', 'Please select an image');
          break;
        }
      }
    }

    return isFormValid;
  }

  void removeVehicleSection(int index) {
    if (vehicleSections.length > 1) {
      vehicleSections.removeAt(index);
      update();
    }
  }

  Future<void> selectVehicleImage(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String filePath = pickedFile.path;
      vehicleSections[index]['image'] = filePath;
      update();
    }
  }

  bool isImageSelected(int index) {
    return vehicleSections[index]['image'] != null;
  }

  void removeVehicleImage(int index) {
    vehicleSections[index]['image'] = null;
    update();
  }
}
