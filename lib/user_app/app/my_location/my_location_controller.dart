
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/models/user_model.dart';
import 'package:mobilegarage/user_app/helper/validators.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class MyLocationController extends GetxController {
  static MyLocationController inatance = Get.find();
  TextEditingController emirateController = TextEditingController();
  TextEditingController adreesdetailController = TextEditingController();

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

  //TODO: Register Function
  updateLocation() async {
    if (await validateForm()) {
      print('object');
    }
  }
  //TODO: Error Variables

  String emirateError = '';
  String addressdetailError = '';
  String latError = '';
  String lngError = '';

// input field validation
  String validateFields(String fieldName, value) {
    switch (fieldName) {
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
    final addressdetailErrorString =
        validateFields('address detail', adreesdetailController.text);

    if (selectedEmirateId == null) {
      emirateError = 'Please select an Emirate';
      update();
    } else {
      emirateError = '';
      update();
    }
    //
    if (lat == null) {
      latError = 'Please select an Address';
      UiUtilites.errorSnackbar('error', 'Please select an Address');
    } else {
      latError = '';
      update();
    }
    //

    return emirateError.isEmpty &&
        addressdetailErrorString.isEmpty &&
        latError.isEmpty;
  }

///////////////
  Position? currentPosition;
  GetStorage box = GetStorage();
  double? lat;
  double? lng;
  String currentAddress = '';
  //
  //
  //
  void onInit() async {
    super.onInit();
    await getEmirates();
    await userdata();
  }

  UserModel? user;
  userdata() async {
    var response = await EditProfileApi.getuser();
    if (response.isNotEmpty) {
      user = UserModel.fromJson(response['user']);
      update();
    }
  }
}
