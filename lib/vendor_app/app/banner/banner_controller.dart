import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/banner_apis/add_banner_api.dart';
import 'package:mobilegarage/apis/vender_apis/banner_apis/get_days_price_api.dart';
import 'package:mobilegarage/models/banner_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VBannerController extends GetxController {
  static VBannerController instance = Get.find();

  File? cover;
  String? base64Cover;

  var selectedValue = 1;
  double? selectedBannerCost;

  void updateSelectedValue(int newValue, double cost) {
    selectedValue = newValue;
    selectedBannerCost = cost;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDayAndPrice();
    update();
  }

  List<BannerModel> banners = [];
  getDayAndPrice() async {
    var response = await VGetDayAndPriceApi.getDayAndPrice();
    if (response.isNotEmpty) {
      List<dynamic> bannerList = response['bannerprice'];
      banners = bannerList.map((banner) => BannerModel.from(banner)).toList();
    }
    if (banners.isNotEmpty) {
      selectedBannerCost = banners[0].cost;
      selectedValue = banners[0].id;
    }

    update();
  }

  storeBanner() async {
    var response = await VAddBannerApi.addBanner(
        banner: base64Cover,
        selectedday: selectedValue.toString(),
        intent: paymentID.toString());
    if (response.isNotEmpty) {
      update();
      Future.delayed(Duration(seconds: 1), () {
        Get.back();
        // UiUtilites.successSnackbar(
        //     'Banner added successfully'.tr, 'Success'.tr);
         UiUtilites.successAlertDialog(
            context: Get.context,
            onTap: () {
              // Get.toNamed(AppRoutes.vsignin);
              Get.back();
            },
            title: 'Thank you!'.tr,
            description:
                'Your banner has been placed successfully!'.tr
                    .tr,
            buttontitle: 'Ok'.tr);
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
         uiSetting(androidTitle: 'Crop Image'.tr, iosTitle: 'Crop Image'.tr),
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

  ///  Stripe payment Integration
  Map<String, dynamic>? paymentIntent;
  String? paymentID;

  Future<void> makePayment(BuildContext context, double price) async {
    try {
      final paymentIntent = await createPaymentIntent(price, 'aed');
      paymentID = paymentIntent['id'];
      print('objectxxxxxxxxxxxxxxxxxxxx${paymentID}xcddxxxxxxxxxxxxxxxxxxxd');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Ikay',
            ),
          )
          .then((value) {});

      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      double amount, String currency) async {
    try {
      final body = {
        'amount': (amount * 100).toStringAsFixed(0),
        'currency': currency,
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        addPoster() async {
          storeBanner();
        }

        addPoster();
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('dfgdf');
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed".tr),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}
