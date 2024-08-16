import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/vendor_app/services/validation_services.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class VEditprofileController extends GetxController {
  static VEditprofileController instance = Get.find();
  TextEditingController garageDescriptionController = TextEditingController();

  File? logo;
  File? cover;

  String garageDescriptionError = '';

  var isButtonClicked = false;
  var isButtonClicked1 = false;

  void onSaveChanges() {
    print(isButtonClicked);
    isButtonClicked = true;
    isButtonClicked1 = true;

    update();
  }

  void onInit() {
    super.onInit();
    print(isButtonClicked);

    isButtonClicked = false;
    isButtonClicked1 = false;
  }

  pickImageFromGallery(String imageName) async {
    final imageSelectorApi = ImageSelectorApi();

    final pickedImage = await imageSelectorApi.selectImageForCropper();
    if (pickedImage != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        uiSettings:
            uiSetting(androidTitle: 'Crop Image', iosTitle: 'Crop Image'),
      );
      if (croppedImage != null || croppedImage!.path.isNotEmpty) {
        switch (imageName) {
          case 'logo':
            logo = File(croppedImage.path);
            // logoError = '';
            update();
            break;
          case 'cover':
            cover = File(croppedImage.path);
            // coverError = '';
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
