import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class TradingLicenseController extends GetxController{
  static TradingLicenseController instanse =Get.find();
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
            uiSetting(androidTitle: 'Crop Image', iosTitle: 'Crop Image'),
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
  
}