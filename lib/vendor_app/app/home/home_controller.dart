import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/garage_status_api.dart';
import 'package:mobilegarage/apis/vender_apis/home_apis/get_garage_api.dart';
import 'package:mobilegarage/models/garage_model.dart';

class VHomeController extends GetxController {
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
    // garagedata();
  }
GarageModel? garage;
garagedata()async{
  var response  = await  VGetGarageApi.getgarage();
  if(response.isNotEmpty){
     garage = GarageModel.fromJson(response['garage']);
     update();
  } 
}
updateGarageStatus()async{
  var response  = await  VGarageStatusApi.updateGarrageStatus();
  if(response.isNotEmpty){
     garage = GarageModel.fromJson(response['garage']);
     update();
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

  var status = GarageModel().obs;

  // end //
  void toggleStatus(bool value) async{
      // if (garage != null) {
           showConfirmationDialog(value, value 
        ? "Are you sure you want to mark your garage as available?" 
        : "Are you sure you want to mark your garage as unavailable?", 
        onConfirm: () async {
           await updateGarageStatus();
          garage!.opened = value;
          update();
         }
         );
       update(); 
    // }
  }

  double ratings = 0.0;
  void updateRating(double rating) {
    ratings = rating;
    update();
  }

  void showConfirmationDialog(bool intendedValue, String message, {VoidCallback? onConfirm}) {
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
                 onConfirm!();
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
