import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/app_colors/app_colors.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class ImageSelectorApi {
  final picker = ImagePicker();

  selectImageForCropper() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      UiUtilites.errorSnackbar('Image selection failed'.tr,
          'Failed to select image, please try again.'.tr);
    }
  }

  Future<List<File>> selectMultipleImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      return pickedFiles.map((file) => File(file.path)).toList();
    } else {
      UiUtilites.errorSnackbar('Image selection failed'.tr,
          'Failed to select image, please try again.'.tr);
      return [];
    }
  }

  selectCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      UiUtilites.errorSnackbar('Image selection failed'.tr,
          'Failed to select image, please try again.'.tr);
    }
  }
}

final aspectRatios = [
  CropAspectRatioPreset.square,
  CropAspectRatioPreset.ratio16x9,
];

uiSetting({
  required String? androidTitle,
  required String? iosTitle,
}) {
  return [
    AndroidUiSettings(
      toolbarTitle: androidTitle,
      toolbarColor: AppColors.primary_color,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.square,
      lockAspectRatio: false,
    ),
    IOSUiSettings(
      title: iosTitle,
    ),
  ];
}
