import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/garage_timings_api/garage_timings_api.dart';
import 'package:mobilegarage/models/garage_timing_model/garage_timing_model.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class GarageTimingsController extends GetxController {
  static GarageTimingsController instance = Get.find();

  TimeOfDay selectedTimeOpenFrom = TimeOfDay.now();
  TimeOfDay selectedTimeOpenTo = TimeOfDay.now();
  TimeOfDay selectedTimeClosedFrom = TimeOfDay.now();
  TimeOfDay selectedTimeClosedTo = TimeOfDay.now();

  List<GarageTimeModel> garageTimings = [
    GarageTimeModel(
      shiftType: "morning",
      openTime: TimeOfDay.now().format(Get.context!),
      closeTime: TimeOfDay.now().format(Get.context!),
    ),
    GarageTimeModel(
      shiftType: "night",
      openTime: TimeOfDay.now().format(Get.context!),
      closeTime: TimeOfDay.now().format(Get.context!),
    ),
  ];

  void updateGarageTimingModel(
      String shiftType, TimeOfDay openTime, TimeOfDay closeTime) {
    final index =
        garageTimings.indexWhere((timing) => timing.shiftType == shiftType);
    if (index != -1) {
      garageTimings[index] = GarageTimeModel(
        shiftType: shiftType,
        openTime: openTime.format(Get.context!),
        closeTime: closeTime.format(Get.context!),
      );
    }
  }

  Future<bool> postGarageTimings(List<GarageTimeModel> garageTimings) async {
    List<Map<String, dynamic>> formattedGarageTimings =
        garageTimings.map((timing) {
      return {
        "shift_type": timing.shiftType,
        "open_time": timing.openTime,
        "close_time": timing.closeTime,
      };
    }).toList();

    var response = await GarageTimingsApi.garageTimings(
      garagetimes: formattedGarageTimings,
    );
    if (response.isNotEmpty) {
      update();
      UiUtilites.successSnackbar('Success', 'Time Added Successfully');
      Get.back();
    }

    return response.isNotEmpty;
  }

  onSaveChanges(Function updateUI) async {
    bool success = await postGarageTimings(garageTimings);
    if (success) {
      updateUI();
    }
  }
}
