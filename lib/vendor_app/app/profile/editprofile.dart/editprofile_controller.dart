import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/edit_profile_apis/edit_profile_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VEditprofileController extends GetxController {
  static VEditprofileController instance = Get.find();
  TextEditingController garageDescriptionController = TextEditingController();

  String garageDescriptionError = '';
  var isButtonClicked = false;

  void onSaveChanges() async {
    var response = await VEditProfileApi.editProfile(
        description: garageDescriptionController.text,
        logo: base64Logo,
        banner: base64Cover);
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      isButtonClicked = true;
    }
    update();
    UiUtilites.successSnackbar('Edit profile successfully', 'Success');
    Get.back();
  }

  @override
  void onInit() async {
    super.onInit();
    isButtonClicked = false;
    await garagedata();
    update();
  }

  GarageModel? garage;
  garagedata() async {
    var response = await VGetGarageApi.getgarage();
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      garageDescriptionController.text = garage!.description!;
      update();
    }
  }

  File? logo;
  File? cover;
  //
  String? base64Logo;
  String? base64Cover;

  pickImageFromGallery(String imageName) async {
    final imageSelectorApi = ImageSelectorApi();

    final pickedImage = await imageSelectorApi.selectImageForCropper();
    if (pickedImage != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        uiSettings:
            uiSetting(androidTitle: 'Crop Image'.tr, iosTitle: 'Crop Image'.tr),
      );
      if (croppedImage != null || croppedImage!.path.isNotEmpty) {
        String base64Image = base64Encode(await croppedImage.readAsBytes());

        switch (imageName) {
          case 'logo':
            logo = File(croppedImage.path);
            base64Logo = base64Image;
            update();
            break;
          case 'cover':
            cover = File(croppedImage.path);
            base64Cover = base64Image;
            update();

          default:
            break;
        }
      } else {
        return null;
      }
    }
  }

  String validateFields(String fieldName, value) {
    switch (fieldName) {
      case 'Garage description':
        garageDescriptionError =
            Validators.emptyStringValidator(value, fieldName) ?? '';
        update();
        return garageDescriptionError;

      default:
        return '';
    }
  }
}
