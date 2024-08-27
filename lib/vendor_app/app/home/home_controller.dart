import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';

class VHomeController extends GetxController {
  var status = false.obs;
  String? image;
  List<String> review = [
    "Review 1",
    "Review 2",
    "Review 3",
    "Review 1",
    "Review 2"
  ];

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    garagedata();
  }

garagedata()async{
  var response  = await  GetGarageApi.getgarage();
  if(response.isNotEmpty){
    print('object');
  } 
}

  // RATING ALERTDIALOG CODE HERE //
  String img = 'https://dummyimage.com/73x73/000/fff';
  TextEditingController nameController = TextEditingController();
  bool isSelected = false;
  void toggleSelection() {
    isSelected = !isSelected;
    update();
  }

  double ratingss = 0.0;
  void updateRatingg(double rating) {
    ratingss = rating;
    update();
  }


  // end //
  void toggleStatus(bool value) {
    if (value) {
      showConfirmationDialog(
          true, "Are you sure you want to mark your garage as available?");
    } else {
      showConfirmationDialog(
          false, "Are you sure you want to mark your garage as unavailable?");
    }
  }

  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  void showConfirmationDialog(bool intendedValue, String message) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  'No',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  status.value = intendedValue;
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
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
