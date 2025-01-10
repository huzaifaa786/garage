import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/car_brand_name_api/get_brand_name_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/car_brands_api/get_Car_Brand_api.dart';
import 'package:mobilegarage/apis/user_apis/auth_apis/signup_apis/vechiles_api/get_vechile_api.dart';
import 'package:mobilegarage/apis/user_apis/my_cars_apis/add_vehicle_api.dart';
import 'package:mobilegarage/apis/user_apis/delete_apis/delete_api.dart';
import 'package:mobilegarage/apis/user_apis/my_cars_apis/my_cars_api.dart';
import 'package:mobilegarage/models/brand_model.dart';
import 'package:mobilegarage/models/brand_name_model.dart';
import 'package:mobilegarage/models/user_vehicles.dart';
import 'package:mobilegarage/models/vehicle_model.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class MyCarsControllers extends GetxController {
  static MyCarsControllers instance = Get.find();
  // List<Map<String, dynamic>> vehicleSections = [];
  // Map<int, Map<String, String>> sectionErrors = {};
  // List<TextEditingController> yearOfManufactureControllers = [];
  // List<TextEditingController> carInfoControllers = [];
  // List<VehicleModel> vehilcles = [];
  // List<BrandModel> brands = [];
  // List<BrandNameModel> brandNames = [];

  // int? selectedVehicleId;
  // int? selectedVehiclebrandId;
  // int? selectedbrandNameId;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getVehicles();
    await fetchUserVehicles();
    await initializeTextControllers();
  }

  List<UserVehicles>? uservehicles = [];
  Future<void> fetchUserVehicles() async {
    var response = await UserVehiclesService.getUserVehicles();
    if (response.isNotEmpty) {
      uservehicles = (response['user_vehicles'] as List<dynamic>)
          .map((item) => UserVehicles.fromJson(item as Map<String, dynamic>))
          .toList();
      update();
    }
  }

  String? selectedValue;

  addvehicle() async {
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
    var response =
        await AddVehiclesApi.addvehicles(includes: formattedVehicleSections);
    if (response.isNotEmpty) {
      vehicleSections.clear();
      await fetchUserVehicles();
    }
  }

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

  final Map<int, TextEditingController> yearOfManufactureControllers = {};
  final Map<int, TextEditingController> carInfoControllers = {};

  initializeTextControllers() {
    final controller = Get.find<MyCarsControllers>();
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

  String vehicletypeerror = '';
  String vehiclebranderror = '';
  String vehiclebrandnameerror = '';
  String yearmanufactureerror = '';
  String vehicleinfoerror = '';
  String imgerror = '';

  // String validateCarFields(String fieldName, dynamic value) {
  //   switch (fieldName) {
  //     case 'vehicletype':
  //       vehicletypeerror = value == null || value.isEmpty
  //           ? 'Please select a vehicle type'.tr
  //           : '';
  //       break;
  //     case 'vehiclebrand':
  //       vehiclebranderror = value == null || value.isEmpty
  //           ? 'Please select a vehicle brand'.tr
  //           : '';
  //       break;
  //     case 'vehiclebrandname':
  //       vehiclebrandnameerror = value == null || value.isEmpty
  //           ? 'Please select a vehicle brand name'.tr
  //           : '';
  //       break;
  //     case 'year_of_manufacture':
  //       yearmanufactureerror = (value == null || value.isEmpty
  //           ? Validators.manufactureYearValidator(value)
  //           : '')!;
  //       break;
  //     case 'vehicle_info':
  //       vehicleinfoerror = value == null || value.isEmpty
  //           ? 'Please enter vehicle information'.tr
  //           : '';
  //       break;
  //     default:
  //       return '';
  //   }
  //   update();
  //   return '';
  // }

 String validateCarFields(
  String fieldName,
  dynamic value, {
  required int index,
}) {
  String errorMessage = '';

  // Ensure sectionErrors entry exists for the given index
  if (!sectionErrors.containsKey(index)) {
    sectionErrors[index] = {};
  }

  // Validation logic based on field name
  switch (fieldName) {
    case 'vehicletype':
      if (value == null) {
        errorMessage = "Please select a vehicle type";
      }
      break;

    case 'vehiclebrand':
      if (value == null || (value is String && value.isEmpty)) {
        errorMessage = "Please select a vehicle brand";
      }
      break;

    case 'vehiclebrandname':
      if (value == null || (value is String && value.isEmpty)) {
        errorMessage = "Please select a vehicle brand name";
      }
      break;

    case 'year_of_manufacture':
      // Pass the actual value (not the controller) to the validator
      errorMessage = Validators.manufactureYearValidator(value) ?? '';
      break;

    case 'vehicle_info':
      if (value == null || (value is String && value.isEmpty)) {
        errorMessage = "Please enter vehicle information";
      }
      break;

    default:
      break;
  }

  
  if (errorMessage.isNotEmpty) {
    sectionErrors[index]![fieldName] = errorMessage;
  } else {
    sectionErrors[index]!.remove(fieldName);
  }

  
  if (sectionErrors[index]!.isEmpty) {
    sectionErrors.remove(index);
  }

  update();
  return errorMessage;
}


  bool validateAllVehicleSections() {
    bool isValid = true;
    sectionErrors.clear();

    for (int index = 0; index < vehicleSections.length; index++) {
      final section = vehicleSections[index];

      validateCarFields('vehicletype', section['vehicletype_id'], index: index);
      validateCarFields('vehiclebrand', section['vehiclebrand_id'],
          index: index);
      validateCarFields('vehiclebrandname', section['vehiclebrandname_id'],
          index: index);
      validateCarFields(
          'year_of_manufacture', section['year_of_manufacture'],
          index: index);
      validateCarFields('vehicle_info', section['vehicle_info'], index: index);

      if (sectionErrors.containsKey(index)) {
        isValid = false;
      }
    }

    if (!isValid) {
      UiUtilites.errorSnackbar(
          'Error'.tr, 'Please fill in all required details.'.tr);
    }

    update();
    return isValid;
  }

  // validateAndProceed(BuildContext context) async {
  //   bool hasErrors = false;

  //   for (int index = 0; index < vehicleSections.length; index++) {
  //     var section = vehicleSections[index];

  //     if (section['vehicletype_id'] == null ||
  //         section['vehiclebrand_id'] == null ||
  //         section['vehiclebrandname_id'] == null ||
  //         section['year_of_manufacture'] == null ||
  //         section['vehicle_info'] == null) {
  //       hasErrors = true;
  //     }
  //   }

  //   if (hasErrors) {
  //     UiUtilites.errorSnackbar(
  //         'Error'.tr, 'Please fill the required details'.tr);
  //   } else {
  //     await addvehicle();
  //   }
  // }

  // Future<bool> validateCarForm() async {
  //   bool isFormValid = true;
  //   sectionErrors.clear();
  //   // Validate form fields
  //   if (selectedVehicleId == null) {
  //     vehicletypeerror = 'Please select a vehicle'.tr;
  //     isFormValid = false;
  //     update();
  //   } else {
  //     vehicletypeerror = '';
  //     update();
  //   }
  //   if (selectedVehicleId == null) {
  //     yearmanufactureerror = validateCarFields(
  //         'year_of_manufacture', yearOfManufactureControllers.toString());
  //     isFormValid = false;
  //     update();
  //   } else {
  //     yearmanufactureerror = '';
  //     update();
  //   }

  //   if (selectedVehiclebrandId == null) {
  //     vehiclebranderror = 'Please select a brand'.tr;
  //     isFormValid = false;
  //     update();
  //   } else {
  //     vehiclebranderror = '';
  //     update();
  //   }

  //   if (selectedbrandNameId == null) {
  //     vehiclebrandnameerror = 'Please select a brand name'.tr;
  //     isFormValid = false;
  //     update();
  //   } else {
  //     vehiclebrandnameerror = '';
  //     update();
  //   }

  //   bool allSectionsValid = validateAllVehicleSections();
  //   isFormValid = isFormValid && allSectionsValid;

  //   if (!isFormValid) {
  //     for (int index = 0; index < sectionErrors.length; index++) {
  //       var errors = sectionErrors[index];
  //       if (errors != null && errors.containsKey('image')) {
  //         UiUtilites.errorSnackbar('error'.tr, 'Please select an image'.tr);
  //         break;
  //       }
  //     }
  //   }

  //   return isFormValid;
  // }

  void removeVehicleSection(int index) {
    if (vehicleSections.length > 1) {
      vehicleSections.removeAt(index);
      update();
    }
  }

  deleteVehicles(id) async {
    var response = await DeleteVehiclesApi.deleteVehicles(id);
    if (response.isNotEmpty) {
      fetchUserVehicles();
      UiUtilites.successSnackbar('Car deleted successfully'.tr, 'Success'.tr);
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
