import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
import 'package:mobilegarage/apis/user_apis/my_location_apis/update_location_api.dart';
import 'package:mobilegarage/apis/vender_apis/auth/signup_apis/get_emirates_apis/get_emirates_api.dart';
import 'package:mobilegarage/models/emirate_model.dart';
import 'package:mobilegarage/models/user_model.dart';
import 'package:mobilegarage/user_app/helper/validators.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';
import 'package:geocoding/geocoding.dart';

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
      var response = await UpdateLocationApi.updateLocation(
          lat: lat.toString(),
          lng: lng.toString(),
          emirateId: selectedemirateName.toString(),
          addressdetail: adreesdetailController.text);
      if (response.isNotEmpty) {
        user = UserModel.fromJson(response['user']);
        update();
      }
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
      emirateError = 'Please select an Emirate'.tr;
      update();
    } else {
      emirateError = '';
      update();
    }
    //
    if (lat == null) {
      latError = 'Please select an Address'.tr;
      UiUtilites.errorSnackbar('Error'.tr, 'Please select an Address'.tr);
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
  @override
  void onInit() async {
    super.onInit();
    await getEmirates();
    await userdata();
    update();
  }

  Future<void> getPlaceName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      currentAddress =
          '${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
    }
    update();
  }

  UserModel? user;
  userdata() async {
    var response = await EditProfileApi.getuser();
    if (response.isNotEmpty) {
      user = UserModel.fromJson(response['user']);
      adreesdetailController.text = user!.addressDetail.toString();

      if (user!.lng != '0' && user!.lat != '0') {
        lat = double.tryParse(user!.lat!);
        lng = double.tryParse(user!.lng!);
        getPlaceName(lat!, lng!);
      }
      update();
    }
  }
}
