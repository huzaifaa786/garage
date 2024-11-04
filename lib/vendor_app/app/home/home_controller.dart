import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_review_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_status_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_review_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/models/garage_reviews_model.dart';
import 'package:mobilegarage/vendor_app/utils/image_picker/image_picker.dart';

class VHomeController extends GetxController {
  String? image;
  File? logo;
  File? cover;
  String? base64Logo;
  String? base64Cover;
  List<String> review = [
    "Review 1",
    "Review 2",
    "Review 3",
    "Review 1",
    "Review 2"
  ];
  List<GarageReviewsModel>? garageReviews = [];

  @override
  void onInit() async {
    super.onInit();
    await garagedata();
    await garageRating();
    await getReviews();
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

  //!  Time Format
  String timeAgo(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);

    final now = DateTime.now();

    final difference = now.difference(dateTime);

    if (difference.inDays >= 1) {
      return difference.inDays == 1
          ? '1 day ago'
          : '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else if (difference.inSeconds >= 1) {
      return difference.inSeconds == 1
          ? '1 second ago'
          : '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
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
      showConfirmationDialog(
        value,
        value
            ? "Are you sure you want to mark your garage as available?"
            : "Are you sure you want to mark your garage as unavailable?",
        onConfirm: () async {
          await updateGarageStatus();
          isSelected = value;
          garage!.opened = value;
          update();
          print(value);
        },
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
                child: const Text(
                  'No',
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
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
