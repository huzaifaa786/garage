import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class VBannerController extends GetxController {
  static VBannerController instance = Get.find();

  File? cover;

  var selectedValue = 1;

  void updateSelectedValue(int newValue) {
    selectedValue = newValue;
    update();
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
          case 'cover':
            cover = File(croppedImage.path);
            print('kkkkkkkkkkkkkkkkkk');
            print(cover);

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
}
