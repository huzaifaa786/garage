import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilegarage/apis/user_apis/edit_profile_apis/edit_profile.dart';
import 'package:mobilegarage/models/user_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  static EditProfileController instance = Get.find();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? img;
  var isButtonClicked = false;

  UserModel? user;
  File? profilepic;
  String? base64pic;

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    receiveArguments();
  }

  void receiveArguments() {
    var args = Get.arguments;
    if (args != null) {
      img = args['image'] ?? '';

      nameController.text = args['userName'] ?? '';
      phoneController.text = args['userNumber'] ?? '';
      emailController.text = args['userEmail'] ?? '';
    }
  }

  void onSaveChanges() async {
    var response = await EditProfileApi.editProfile(
      username: nameController.text,
      
      profileimage: base64pic,
      phone: phoneController.text,
    );
    if (response.isNotEmpty) {
      user = UserModel.fromJson(response['user']);
      isButtonClicked = true;
    }
    update();
    Get.back();

  }

  pickImageFromGallery(String imageName) async {
    final imageSelectorApi = ImageSelectorApi();

    final pickedImage = await imageSelectorApi.selectImageForCropper();
    if (pickedImage != null) {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        uiSettings:
            uiSetting(androidTitle: 'Crop Image'.tr, iosTitle: 'Crop Image'.tr),
      );
      if (croppedImage != null && croppedImage.path.isNotEmpty) {
        String base64Image = base64Encode(await croppedImage.readAsBytes());

        switch (imageName) {
          case 'profilepic': // Fix here
            profilepic = File(croppedImage.path);
            base64pic = base64Image;
            update(); // Force update
            break;
        }
      }
    }
  }
}
