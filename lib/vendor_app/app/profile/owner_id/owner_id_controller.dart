import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/edit_profile_apis/update_ownerid_api.dart';
import 'package:mobilegarage/apis/vender_apis/edit_profile_apis/update_trading_license_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class OwnerIdController extends GetxController {
  static OwnerIdController instanse = Get.find();

  File? idfront;
  String? base64idfront;
  File? idback;
  String? base64idback;
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
          case 'idfront':
            idfront = File(croppedImage.path);
            base64idfront = base64Image;
            update();
            break;
               case 'idback':
            idback = File(croppedImage.path);
            base64idback = base64Image;
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

  void removeLicenseImage(String imageName) {
     switch (imageName) {
    
      case 'idfront':
        idfront = null;
        base64idfront = null;
        break;
      case 'idback':
        idback = null;
        base64idback = null;
        break;
    }
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
    if (base64idback == null||base64idfront == null) {
      UiUtilites.errorSnackbar('Error', 'Please select license image');
      return;
    }
    var response = await VUpdateOwnerIdApi.updateownerid(base64idfront,base64idback);
    if (response.isNotEmpty) {
      garagedata();
      garage = GarageModel.fromJson(response['garage']);
      UiUtilites.successSnackbar('License updated successfully', 'Success');
      Get.back();

      update();
    }
  }
}
