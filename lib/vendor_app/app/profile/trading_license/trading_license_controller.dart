import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/edit_profile_apis/update_trading_license_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class TradingLicenseController extends GetxController {
  static TradingLicenseController instanse = Get.find();
  File? license;
  String? base64license;

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
          case 'upload_license':
            license = File(croppedImage.path);
            base64license = base64Image;
            update();
            break;
          default:
            break;
        }
      } else {
        print('error');
        update();
        return null;
      }
    }
  }

  void removeLicenseImage() {
    license = null;
    base64license = null;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    garagedata();
    update();
  }

  GarageModel? garage;
  garagedata() async {
    var response = await VGetGarageApi.getgarage();
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      update();
    }
  }

  updatelicense() async {
    if (base64license == null) {
      UiUtilites.errorSnackbar('Error', 'Please select license image');
      return;
    }
    var response = await VUpdateLicenseApi.updateLicense(base64license);
    if (response.isNotEmpty) {
      garagedata();
      garage = GarageModel.fromJson(response['garage']);
      UiUtilites.successSnackbar('License updated successfully', 'Success');
      Get.back();

      update();
    }
  }
}
