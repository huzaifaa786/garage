import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/banner_apis/add_banner_api.dart';
import 'package:mobilegarage/apis/vender_apis/banner_apis/get_days_price_api.dart';
import 'package:mobilegarage/models/banner_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class VBannerController extends GetxController {
  static VBannerController instance = Get.find();

  File? cover;
  String? base64Cover;

  var selectedValue = 1;

  void updateSelectedValue(int newValue) {
    selectedValue = newValue;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // getDayAndPrice();
    update();
  }

  List<BannerModel> banners = [];
  getDayAndPrice() async {
    var response = await VGetDayAndPriceApi.getDayAndPrice();
    if (response.isNotEmpty) {
      List<dynamic> bannerList = response['bannerprice'];
      banners = bannerList.map((banner) => BannerModel.from(banner)).toList();
    }
    update();
  }

  storeBanner() async {
    var response = await VAddBannerApi.addBanner(
        banner: base64Cover, selectedday: selectedValue.toString());
    if (response.isNotEmpty) {
      update();
      Future.delayed(Duration(seconds: 3), () {
          Get.back();
        });
    }
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
        String base64Image = base64Encode(await croppedImage.readAsBytes());

        switch (imageName) {
          case 'cover':
            cover = File(croppedImage.path);
            base64Cover = base64Image;
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
