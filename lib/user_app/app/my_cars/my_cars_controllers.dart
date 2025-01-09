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

////////
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

  bool validateAllVehicleSections() {
    bool isValid = true;
    sectionErrors.clear();
    for (int index = 0; index < vehicleSections.length; index++) {
      // var errors = sectionErrors[index];
      final section = vehicleSections[index];
      final errors = <String, String>{};
      // Validate vehicle type
      if (section['vehicletype_id'] == null) {
        errors['vehicletype'] = 'Please select a vehicle type'.tr;
        isValid = false;
      }

      // Validate vehicle brand
      if (section['vehiclebrand_id'] == null) {
        errors['vehiclebrand'] = 'Please select a vehicle brand'.tr;
        isValid = false;
      }

      // Validate vehicle brand name
      if (section['vehiclebrandname_id'] == null) {
        errors['vehiclebrandname'] = 'Please select a vehicle brand name'.tr;
        isValid = false;
      }

      // Validate year of manufacture
      if (section['year_of_manufacture']?.isEmpty ?? true) {
        errors['year_of_manufacture'] =
            'Please enter the year of manufacture'.tr;
        isValid = false;
      }

      // Validate vehicle information
      if (section['vehicle_info']?.isEmpty ?? true) {
        errors['vehicle_info'] = 'Please enter vehicle information'.tr;
        isValid = false;
      }
      // Validate image
      if (section['image'] == null) {
        errors['image'] = 'Please select an image'.tr;
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
      break;
    case 'vehiclebrand':
      vehiclebranderror =
          Validators.emptyStringValidator(value, fieldName) ?? '';
      break;
    case 'vehiclebrandname':
      vehiclebrandnameerror =
          Validators.emptyStringValidator(value, fieldName) ?? '';
      break;
    case 'year_of_manufacture':
      yearmanufactureerror =
          Validators.manufactureYearValidator(value) ?? '';
      break;
    case 'vehicle_info':
      vehicleinfoerror =
          Validators.emptyStringValidator(value, fieldName) ?? '';
      break;
    default:
      return '';
  }
  update();
  return '';
}

Future<bool> validateCarForm() async {
  bool isFormValid = true;

  // Validate fields with direct checks
  vehicletypeerror = selectedVehicleId == null
      ? 'Please select a vehicle'.tr
      : '';
  if (vehicletypeerror.isNotEmpty) isFormValid = false;

  vehiclebranderror = selectedVehiclebrandId == null
      ? 'Please select a brand'.tr
      : '';
  if (vehiclebranderror.isNotEmpty) isFormValid = false;

  vehiclebrandnameerror = selectedbrandNameId == null
      ? 'Please select a brand name'.tr
      : '';
  if (vehiclebrandnameerror.isNotEmpty) isFormValid = false;

  yearmanufactureerror = Validators.manufactureYearValidator(
          yearOfManufactureControllers.toString()) ??
      '';
  if (yearmanufactureerror.isNotEmpty) isFormValid = false;

  vehicleinfoerror = selectedVehicleId == null
      ? "Please write information about the vehicle"
      : '';
  if (vehicleinfoerror.isNotEmpty) isFormValid = false;

  // Validate all sections
  bool allSectionsValid = validateAllVehicleSections();
  isFormValid = isFormValid && allSectionsValid;

  if (!isFormValid) {
    for (int index = 0; index < sectionErrors.length; index++) {
      var errors = sectionErrors[index];
      if (errors != null && errors.containsKey('image')) {
        UiUtilites.errorSnackbar('error'.tr, 'Please select an image'.tr);
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
