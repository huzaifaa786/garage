import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/chatify/user_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_review_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_status_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_review_api.dart';
import 'package:mobilegarage/apis/vender_apis/notifications_api/garage_notification_count_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/models/garage_reviews_model.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/app/home/components/reviewcard.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class VHomeController extends GetxController {
  String? image;
  File? logo;
  File? cover;
  String? base64Logo;
  String? base64Cover;

  List<GarageReviewsModel> garageReviews = [];

  @override
  void onInit() async {
    super.onInit();
    await garagedata();
    await garageRating();
    await getReviews();
    await countNotification();
    await countUnSeenMsg();
  }

  String? notificationcount = '';

  countNotification() async {
    var response = await GarageNotificationCountApi.countNotification();
    if (response.isNotEmpty) {
      notificationcount = response['count'].toString();
      update();
    }
  }

  String? msgUnSeenCount = '';

  countUnSeenMsg() async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/unseen/all';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token')!,
    };
    var response = await Api.execute(url: url, data: data);
    msgUnSeenCount = response['unseen'].toString();
    update();
    LoadingHelper.dismiss();
  }

  getReviews() async {
    var response = await GarageReviewsApi.garageReviews(garage!.id.toString());
    if (response.isNotEmpty && response['ratings'] != null) {
      garageReviews = (response['ratings'] as List<dynamic>)
          .map((item) => GarageReviewsModel.fromJson(item))
          .toList();
      update();
    }
    ;
  }

  getReviewsonClick() async {
    var response = await GarageReviewsApi.garageReviews(garage!.id.toString());
    if (response.isNotEmpty && response['ratings'] != null) {
      garageReviews = (response['ratings'] as List<dynamic>)
          .map((item) => GarageReviewsModel.fromJson(item))
          .toList();
      _openReviewBottomSheet(Get.context!);

      update();
    }
    ;
  }

  //!  Time Format
  String timeAgo(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);

    final now = DateTime.now();

    final difference = now.difference(dateTime);

    if (difference.inDays >= 1) {
      return difference.inDays == 1
          ? '1 day ago'.tr
          : '${difference.inDays}' 'days ago'.tr;
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1
          ? '1 hour ago'.tr
          : '${difference.inHours}' 'hours ago'.tr;
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1
          ? '1 minute ago'.tr
          : '${difference.inMinutes}' 'minutes ago'.tr;
    } else if (difference.inSeconds >= 1) {
      return difference.inSeconds == 1
          ? '1 second ago'.tr
          : '${difference.inSeconds}' 'seconds ago'.tr;
    } else {
      return 'Just now'.tr;
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

  GarageModel? garage;
  
  garagedata() async {
    var response = await VGetGarageApi.getgarage();
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      isSelected = garage!.opened;
      update();
    }
  }

  garageRating() async {
    var response = await GetReviewApi.getgarageReview(garage!.id.toString());
    if (response.isNotEmpty) {
      // garage = GarageModel.fromJson(response['garage']);
      // isSelected = garage!.opened;
      update();
    }
  }

  updateGarageStatus() async {
    var response = await VGarageStatusApi.updateGarrageStatus();
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      update();
    }
  }

  // RATING ALERTDIALOG CODE HERE //
  String img = 'https://dummyimage.com/73x73/000/fff';
  TextEditingController nameController = TextEditingController();
  bool? isSelected;
  void toggleSelection() {
    isSelected = !isSelected!;
    update();
  }

  double ratingss = 0.0;
  void updateRatingg(double rating) {
    ratingss = rating;
    update();
  }

  void toggleStatus(bool value) {
    if (garage != null) {
      // showConfirmationDialog(
      //   value,
      //   value
      //       ? "Are you sure you want to mark your garage as available?".tr
      //       : "Are you sure you want to mark your garage as unavailable?".tr,
      //   onConfirm: () async {
      //     await updateGarageStatus();
      //     isSelected = value;
      //     garage!.opened = value;
      //     update();
      //     print(value);
      //   },
      // );
      UiUtilites.confirmAlertDialog(
        context: Get.context,
        onCancelTap: () {
          Get.back();
        },
        onConfirmTap: () async {
          await updateGarageStatus();
          isSelected = value;
          garage!.opened = value;
          update();
          Get.back();
        },
        title: value
            ? "Are you sure you want to mark your garage as available?".tr
            : "Are you sure you want to mark your garage as unavailable?".tr,
        cancelText: 'No'.tr,
        confirmText: 'Yes'.tr,
      );
    }
  }

/////
  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  void showConfirmationDialog(bool intendedValue, String message,
      {VoidCallback? onConfirm}) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  'No'.tr,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  onConfirm!();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  'Yes'.tr,
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
  void _openReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GetBuilder<VHomeController>(
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reviews'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Divider(
                    color: const Color.fromARGB(255, 209, 208, 208),
                    thickness: 1.0,
                  ),
                  Gap(10),
                  SizedBox(
                    height: Get.height * 0.42,
                    child: controller.garageReviews.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.garageReviews.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = controller.garageReviews[index];
                              return Reviewcard(
                                reviews: item,
                                img: 'assets/images/avatar.svg',
                              );
                            },
                          )
                        : Center(
                            child: AppText(
                              title: 'No Review Found!'.tr,
                              color: AppColors.darkGrey,
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
